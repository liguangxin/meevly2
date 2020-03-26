<?php

namespace App\Events;

use Carbon\Carbon;

use App\Services\RecordingTimeService;

use App\UserRecord;

use Illuminate\Queue\SerializesModels;

class UserRecordSaving
{
    use SerializesModels;

    /**
     * @var UserRecord
     */
    public $record;

    /**
     * Create a new event instance.
     *
     * @param  \App\UserRecord  $record
     * @return void
     */
    public function __construct(UserRecord $record)
    {
        $this->record = $record;

        $this->calculateTime();
        $this->calculateCashout();

        $this->calculatePayments();
    }

    private function calculateTime(): void {
        if ($this->record->action !== UserRecord::ACTION_WITHOUT_ANSWER || isset($this->record->recorded_at)) {
            return;
        }

        $this->record->recorded_at = RecordingTimeService::calculate();
    }

    private function calculateCashout(): void {
        if ($this->record->action !== UserRecord::ACTION_WITHOUT_ANSWER) {
            return;
        }

        if ( empty( $this->record->id ) ) {
            $this->record->stake = $this->record->owner->stake;
        }

        $this->record->cashout = $this->record->bankroll - $this->record->stake;

        if ($this->record->cashout < 0) {
            $this->record->cashout = 0;

            $this->record->action = UserRecord::ACTION_SMALL_PROFIT;
        }

        if ($this->record->cashout >= 140) {
            $this->record->action = UserRecord::ACTION_CASHOUT;
        }
    }

    private function calculatePayments(): void {
        if ($this->record->action !== UserRecord::ACTION_CASHOUT) {
            return;
        }

        $formulas = [
            [
                'name' => 'ft_cashout',
                'piece' => $this->record->owner->ft_profit_share
            ],

            [
                'name' => 'st_cashout',
                'piece' => $this->record->owner->st_profit_share
            ],

            [
                'name' => 'af_cashout',
                'piece' => $this->record->owner->affiliate_share
            ]
        ];

        $child_formulas = [
            [
                'name' => 'tt_cashout',
                'piece' => $this->record->owner->tt_profit_share
            ],

            [
                'name' => 'fth_cashout',
                'piece' => $this->record->owner->fth_profit_share
            ]
        ];

        foreach ($formulas as $formula) {
            if ($formula['piece'] == 0) {
                continue;
            }

            $this->record->{$formula['name']} = bcmul($this->record->cashout, bcmul($this->record->owner->profit_share / 100, $formula['piece'] / 100, 6), 6);

            $fee = bcmul($this->record->{$formula['name']}, bcdiv($this->record->owner->transfer_fee, 2, 6), 6);

            if ( $fee < 0.25 ) {
                $fee = 0.25;
            }

            $this->record->{$formula['name']} = bcsub($this->record->{$formula['name']}, $fee, 2);
        }

        foreach ($child_formulas as $formula) {
            if ($formula['piece'] == 0) {
                continue;
            }

            $this->record->{$formula['name']} = bcmul( ($this->record->ft_cashout + $this->record->st_cashout ), $formula['piece'] / 100, 6);
        }
    }
}

const autocomplete = require('devbridge-autocomplete');

$('#autocomplete').autocomplete({
    lookup: function (query, done) {
        if (query.length < 3) {
            return done({ suggestions: [] });
        }

        const FINAL_AUTOCOMPLETE_URL = AUTOCOMPLETE_URL.replace('!term!', query);

        $.getJSON(FINAL_AUTOCOMPLETE_URL, function (result) {
            const suggestions = result.map(function (entry) {
                return { data: entry.id, value: entry.name };
            });

            done({ suggestions });
        });
    },

    onSelect: function (user) {
        const selectors = [
            'input[name="user_id"]',
            'input[name="owner_id"]'
        ];

        for (const selector of selectors) {
            const element = $(selector);

            if (!element.length) {
                continue;
            }

            element.val(user.data);
        }
    }
});

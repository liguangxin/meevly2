$('.payment-received').change(function () {
    const form = $(this).closest('form');

    $.post(
        form.attr('action'),
        form.serialize()
    );
});

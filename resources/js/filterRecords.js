$('.filter-by-date').change(function () {
    const value = $(this).val();

    if (!value) {
        return;
    }

    window.location = $(this).data('url').replace('!date!', value);
});


    $(document).ready(function () {
        // Initialize popover
        $('[data-toggle="popover"]').popover({
            html: true,
            content: function () {
                return $(this).next('.d-none').html();
            }
        });
    });

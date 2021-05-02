$(document).ready(function () {
    $('.buy-ajax').click(function () {
        let value = $(this).parent().children('.msp-ajax').val();
        $.ajax({
            url: 'xu-ly-gio-hang',
            method: 'POST',
            data: {
                id: value,
                soluong: 1
            },
            success: function (result) {
                let value = result.split("-");
                $('.amount').html(value[0]);
            }
        })
    });
});
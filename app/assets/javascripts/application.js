// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require jquery_ujs
//= require bootstrap.min
//= require jasny-bootstrap.min
//= require geo


$(function(){
    $('.business-signup-form').submit(function (e) {
        var errors = false;
        var fields = $(this).find('input.form-control').each(function () {
            if ($.trim(this.value) === '') {
                errors = true;
            }
        });
        if (errors) {
            $('#error-modal').find('.modal-body').text('All fields are required');
            $('#error-modal').modal('show');
            return false;
        } else {
            return true;
        }

    });
});

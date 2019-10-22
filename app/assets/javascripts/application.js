// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require popper
//= require bootstrap
//= require bootstrap-datepicker
//= require moment
//= require fullcalendar
//= require select2
//= require rails-ujs
//= require ckeditor/config
//= require rails.validations
//= require_tree .

// upload anh
$(document).ready(function(){
  // Upload anh
   $('.upload').change(function(){
       $('.upload').parent().submit();
   });
   // end Upload anh
});
// end uploadanh

$(document).ready(function() {

  $(".js-example-tags").select2({
      tags: true
  });

  $('.add').keyup(function(){
      let email = $('.add').val();
      console.log(email);
      $.ajax({
        url: '/ajax/getemail',
        type: 'GET',
        data: {
          email: email
        },
        success: function(data){
          window.location.reload()
        }
      })
  });

  //View more
  $('.moreless-button').click(function() {
    $('.moretext').slideToggle();
    if ($('.moreless-button').text() == "Read more") {
      $(this).text("Read less")
    } else {
      $(this).text("Read more")
    }
  });

});

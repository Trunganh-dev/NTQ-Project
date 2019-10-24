// upload anh
$(document).ready(function(){
  // debugger
    $('.upload').change(function(){
        $(this).parent().submit();
    }); 
 });
 
//  select 2
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
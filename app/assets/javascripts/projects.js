// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
//

$(document).on('ready page:load', function() {
  // if (top.location.pathname === '/'){
  //   $('#nav').css('background-color', 'rgba(255,255,255, 0)')
  //   $('#nav').removeClass('nav');
  // }else{
  //   $('#nav').css('background-color', 'rgba(255,255,255, 1)')
  //   $('#nav').addClass('nav');
  // }


  $(function () {
    var body = $('.splash-image');
    var backgrounds = [
      'url("/assets/image1.jpg")',
      'url("/assets/image2.jpg")',
      'url("/assets/image3.jpg")',
      'url("/assets/image4.jpg")',
      'url("/assets/image5.jpg")'];
    var current = 0;

    function nextBackground() {
      body.fadeTo(500, 0.75 , function(){

        body.css(
          {'background': backgrounds[current = ++current % backgrounds.length] + ' 50% 50% no-repeat', 'background-size': 'cover'}
        );

          setTimeout(nextBackground, 7000);
      }).fadeTo(1500, 1)
    }
    setTimeout(nextBackground, 7000);
    body.css({'background': backgrounds[0] + ' 50% 50% no-repeat', 'background-size': 'cover'});
});

  $('#search-form').submit(function(ev) {
    ev.preventDefault();

    var searchValue = $('#search').val();

    $.ajax({
      url: '/projects?search=' + searchValue,
      type: 'GET',
      dataType: 'html'
    }).done(function(data) {
      $('#projects').html(data);
    });
  });


  $('.rewards').hover(
    function(){
      var child = this.children;
      $(child[0]).css('display', 'block');
    }, function(){
      var child = this.children;
      $(child[0]).css('display', 'none');
    }
  );

  $('.new-pledge').on('click', function(eventObject) {
    // eventObject.preventDefault();
    // eventObject.stopPropagation(); // Not sure why this is needed, but if I don't include it, the link is still followed
    console.log(this)
    var id = $(this).data('reward');
    console.log(id)

    $.ajax({
      url: '/rewards/' + id + '/pledges' ,
      type: 'POST',
      success: function(data) {
        $('#project-funding-status').html(data);
        $('#backed').html("<h3>You've backed this project!</h3>")

        // Scroll to top of the page to show call attention to 'You've backed this project!' message and new total money amount
        $("html, body").scrollTop(0);
        // $('#project-total-money').animate({ backgroundColor: "#ff0000", color: "black" }, 5000, 'swing');

      }
    });
  })
});

// Only on the homepage do this animation
  if (top.location.pathname === '/' || top.location.pathname === '/projects'){
    $(window).on('scroll', function(){
        console.log($(this).scrollTop());
        if ($(this).scrollTop() >= 630){
            $('.homepage-nav').attr('id','nav');
        }
        else if ($(this).scrollTop() < 630){
          $('.homepage-nav').removeAttr('id','nav');
        }
    })
  }

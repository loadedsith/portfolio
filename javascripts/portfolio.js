$(document).ready(function(){
  $(document).foundation();
  
  $('.moreInfo').on('click', function(e) {
    
    e.preventDefault();
    $('ul').each(function(){
      if($(this).hasClass('open')){
       // $(this).close();
//          $(this).removeClass('open')
        $(this).hide();
        console.log($(this));
        console.log("is ready");
      }

    });
    
    $.ajax({
      url: this.getAttribute('href'),
      dataType: 'html',
      method: 'get',
      success: function(data, status, xhr) {

  	      var new_service = $(data).filter(".wrapper").html();
  			  console.log(new_service);
  	      $('#moreInfo').empty().append("<a class='close-reveal-modal' href='#'> × </a>"+new_service);
           $('#moreInfo').foundation('reveal', 'open');
           
      }
    });
  });

$("#jsboxes").css("height","0px");
$("#jsboxes").css("overflow","visible");

});
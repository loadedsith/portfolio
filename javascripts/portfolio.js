$(document).ready(function(){
  $(document).foundation();
  Backbone.history.start();
  
  $('.moreInfo').on('click', function(e) {
       e.preventDefault();
       document.location.href = "./#"+this.getAttribute('href');
        try{
          $('ul').each(function(){
            if($(this).hasClass('open')){
             // $(this).close();
             // $(this).removeClass('open')
              $(this).hide();
                }
              });
            }catch(e) {}
       });

   $("#jsboxes").css("height","0px");
   $("#jsboxes").css("overflow","visible");

   });

    var PortfolioRouter = Backbone.Router.extend({
      routes:{
        "":"doNothing",
        "*page":"loadAjaxPage",
      },
      doNothing:function(){
     //   alert('doNothing');
        
      },
      loadAjaxPage:function(page){
//        alert('loadAjaxPage: ' + page);
        $.ajax({
            url: page,
            dataType: 'html',
            method: 'get',
            success: function(data, status, xhr) {

                var new_service = $(data).filter(".wrapper").html();
                console.log(new_service);
                $('#moreInfo').empty().append("<a class='close-reveal-modal' href='#'> × </a>"+new_service);
                 $('#moreInfo').foundation('reveal', 'open');
           
            }
         });
       }
      
    });
    var portfolioRouter = new PortfolioRouter();

  


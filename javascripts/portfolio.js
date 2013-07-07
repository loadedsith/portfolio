var PortfolioRouter = Backbone.Router.extend({
  
  routes:{
    "":"doNothing",
    ":page":"loadAjaxPage",
  },
  doNothing:function(){
    // alert('doNothing');
    
  },
  loadAjaxPage:function(page){
    // alert("fragment:" +Backbone.history.fragment);
    $.ajax({
        url: page,
        dataType: 'html',
        method: 'get',
        success: function(data, status, xhr) {
          var pageData = $(data).filter(".wrapper").html();
          $('#moreInfoContent').html(pageData);
          $('#moreInfo').foundation('reveal', 'open');
        },
     });
  }
});

var portfolioRouter = new PortfolioRouter();

$(document).ready(function(){
  $(document).foundation();
  Backbone.history.start();

  $('.moreInfo').on('click', function(e) {
    e.preventDefault();
    portfolioRouter.navigate(this.getAttribute('href'),{trigger: true});
    // 
    try{
      $('ul.content').each(function(){
      if($(this).hasClass('open')){
        $(this)
          .css(Foundation.rtl ? 'right':'left', '-99999px')
          .removeClass('open');
        $(this).trigger('closed');
        }
      });
    }catch(e) {}
  });
  $("#jsboxes").css("height","0px");
  $("#jsboxes").css("overflow","visible");

 });

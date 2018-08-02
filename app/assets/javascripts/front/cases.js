// # /* ------------------------------------------------
// #     Popup
// #     ------------------------------------------------ */

// #     var popup_item = $("#popup");

// #     if(popup_item.length){

// #       popup_item.fadeOut();

// #         $(document).mouseup(function (e) {

// #           var container = $(".case-popup");
// #           if (container.has(e.target).length == 0){
// #               container.fadeOut("slow");
// #           }

// #       });

// #       $('.open-popup').on('click', function() {
// #           popup_item.fadeIn("slow");
// #           return false;
// #         });

// #         $('.close-popup').on('click', function() {
// #           popup_item.fadeOut("slow");
// #         });

// #     }

$(document).ready(function(){

  $('.open-popup').on('click', function(e) {
    e.preventDefault();
    var self = $(this);
    // Номер попапа - self.data('index') -> число
    var index = self.data('index');
    var popup_item = $("#popup_"+index);
    popup_item.fadeIn("slow");
    // return false;
  });

  $('.close-popup').on('click', function() {
    var popup_item = $(this).parent().parent();
    
    // console.log(popup_item);
    popup_item.fadeOut("slow");
  });

});
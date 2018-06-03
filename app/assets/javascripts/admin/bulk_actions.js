
$(document).ready(function(){
  $('input').on('ifToggled', function(event){
      var check_count = $('input:checked').length;  //count the number of checked elements
      if( check_count > 1 ) {
        $("#bulk-actions").fadeIn(400).show();
      } else {
        $("#bulk-actions").fadeOut(400).hide();
      }
  });    
});

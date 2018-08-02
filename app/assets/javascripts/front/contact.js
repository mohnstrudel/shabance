    // # /* ---------------------------------------------------- */
    // #     /*  Contact Form                    */
    // #     /* ---------------------------------------------------- */

    // # if ($('#contact-form').length){

    // #   var cf = $('#contact-form');
    // #   cf.append('<div class="message-container"></div>');

    // #   cf.on("submit",function(event){

    // #     var self = $(this),text;

    // #     var request = $.ajax({
    // #       url:"bat/mail.php",
    // #       type : "post",
    // #       data : self.serialize()
    // #     });

    // #     request.then(function(data){
    // #       if(data == "1"){

    // #         text = "Your message has been sent successfully!";

    // #         cf.find('input:not([type="submit"]),textarea').val('');

    // #         $('.message-container').html('<div class="alert-success"><p>'+text+'</p></div>')
    // #           .delay(150)
    // #           .slideDown(300)
    // #           .delay(4000)
    // #           .slideUp(300,function(){
    // #             $(this).html("");
    // #           });

    // #       }
    // #       else{
    // #         if(cf.find('textarea').val().length < 20){
    // #           text = "Message must contain at least 20 characters!"
    // #         }
    // #         if(cf.find('input').val() == ""){
    // #           text = "All required fields must be filled!";
    // #         }
    // #         $('.message-container').html('<div class="alert-error"><p>'+text+'</p></div>')
    // #           .delay(150)
    // #           .slideDown(300)
    // #           .delay(4000)
    // #           .slideUp(300,function(){
    // #             $(this).html("");
    // #           });
    // #       }
    // #     },function(){
    // #       $('.message-container').html('<div class="alert-error"><p>Connection to server failed!</p></div>')
    // #           .delay(150)
    // #           .slideDown(300)
    // #           .delay(4000)
    // #           .slideUp(300,function(){
    // #             $(this).html("");
    // #           });
    // #     });

    // #     event.preventDefault();

    // #   });

    // # }
    // /* ---------------------------------------------------- */
    //     /*  Newsletter                      */
    //     /* ---------------------------------------------------- */

    //   var subscribe = $('[id^="newsletter"]');
    //     subscribe.append('<div class="message-container-subscribe"></div>');
    //     var message = $('.message-container-subscribe'),text;

    //     subscribe.on('submit',function(e){
    //       var self = $(this);
          
    //       if(self.find('input[type="email"]').val() == ''){
    //         text = "Please enter your e-mail!";
    //         message.html('<div class="alert-warning"><p>'+text+'</p></div>')
    //           .slideDown()
    //           .delay(4000)
    //           .slideUp(function(){
    //             $(this).html("");
    //           });

    //       }else{
    //         self.find('span.error').hide();
    //         $.ajax({
    //           type: "POST",
    //           url: "bat/newsletter.php",
    //           data: self.serialize(), 
    //           success: function(data){
    //             if(data == '1'){
    //               text = "Your email has been sent successfully!";
    //               message.html('<div class="alert-success"><p>'+text+'</p></div>')
    //                 .slideDown()
    //                 .delay(4000)
    //                 .slideUp(function(){
    //                   $(this).html("");
    //                 })
    //                 .prevAll('input[type="email"]').val("");
    //             }else{
    //               text = "Invalid email address!";
    //               message.html('<div class="alert-error"><p>'+text+'</p></div>')
    //                 .slideDown()
    //                 .delay(4000)
    //                 .slideUp(function(){
    //                   $(this).html("");
    //                 });
    //             }
    //           }
    //         });
    //       }
    //       e.preventDefault();
    //   });
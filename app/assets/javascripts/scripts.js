$(function() {

    var navigation = responsiveNav("#nav", {
        animate: false,        // Boolean: Use CSS3 transitions, true or false
        transition: 400,      // Integer: Speed of the transition, in milliseconds
        label: "",        // String: Label for the navigation toggle
        insert: "after",      // String: Insert the toggle before or after the navigation
        customToggle: "",     // Selector: Specify the ID of a custom toggle
        openPos: "relative",  // String: Position of the opened nav, relative or static
        jsClass: "resnav",        // String: 'JS enabled' class which is added to <html> el
    });

    $('#toc').accordion({
        oneOpenedItem   : true,
        speed           : 700,
    });

});

//Keeps links inside mobile safari when launched from homescreen.
//http://stackoverflow.com/questions/2898740/iphone-safari-web-app-opens-links-in-new-window
$(document).ready(function(){
    if (("standalone" in window.navigator) && window.navigator.standalone) {
      // For iOS Apps
      $('a').on('click', function(e){
        e.preventDefault();
        var new_location = $(this).attr('href');
        if (new_location != undefined && new_location.substr(0, 1) != '#' && $(this).attr('data-method') == undefined){
          window.location = new_location;
        }
      });
    }
  });
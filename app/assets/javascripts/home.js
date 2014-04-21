# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



//$(this) references the id of the button
var showAlert = function(){
  alert($(this).attr("id"));
};





$(document).ready(function() {
  
    $(".my-button").click(showAlert);
});


// .button-container is a class, that contains the event to that class
  $(".button-container").on("click", ".my-button", function() {
    alert("hey");
  });
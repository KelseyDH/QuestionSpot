// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

////jQuery UI Practice:
//Make Buttons draggable
$(document).ready(function() {
  $(".btn.btn-primary").draggable({start: function(){$("h1").text("Dragging")}, stop: function() {$("h1").text("Stopped")}});
});

$(document).ready(function() {

  $("ul li").draggable({start: function() {$(this).fadeOut(500)  } });
});


//Gives a random effect from jQuery
// randomEffect = effects[Math.floor(Math.random()*effects.length)]


$(document).ready(function() {

  $(".btn.btn-success").on("click", function(){ 
    effects = ["shake", "bounce", "spin"]
    randomEffect = effects[Math.floor(Math.random()* effects.length)];
    $(this).effect(randomEffect)
  });
});



//////////////////

// //$(this) references the id of the button
// var showAlert = function(){
//   alert($(this).attr("id"));
// };





// $(document).ready(function() {
  
//     $(".my-button").click(showAlert);
// });


// // .button-container is a class, that contains the event to that class
//   $(".button-container").on("click", ".my-button", function() {
//     alert("hey");
//   });

//    //Animate buttons to make them fadeout
// $("btn").animate({width: "1000%", height: "1000%"}, 1000, function() {$(this).fadeOut()});

// $(".btn").slideUp(500, function(){$(this).remove()});

// $(".btn.btn-primary").draggable({stop: function() {alert("drag complete")}})

// $(".btn.btn-primary").animate({width: "1000%", height: "1000%"}, 1000, function() {$(this).fadeOut()});

// //Make Buttons draggable
// $(".btn.btn-primary").draggable({start: function(){$("h1").text("Dragging")}, stop: function() {$("h1").text("Stopped")}});
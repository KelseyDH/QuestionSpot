// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.



// //$(this) references the id of the button
// var showAlert = function(){
//   alert($(this).attr("id"));
// };





// $(document).ready(function() {
  
//     $(".my-button").click(showAlert);
// });


// .button-container is a class, that contains the event to that class
  $(".button-container").on("click", ".my-button", function() {
    alert("hey");
  });



//remove button

$(document).on("click", ".my-button", function() {
    $(this).parents(".well").fadeOut();
});

// ///////////////////////

////Type in box and press enter adds a list item of that text
$(document).on("keyup", "#task", function(event){

    var $li, keycode;
    keycode = event.keycode ? event.keycode : event.which;
    console.log(keycode);
    if (keycode === 13) {
      $li = $("<li>", {
        text: $(this).val(),
        "class": "task"  
      });
      $("ul.tasks").append($li);
      $(this).val("");
    }
  });


///clicking on text deletes list item
$(document).on("click", "ul.tasks li", function(){
  $(this).fadeOut();
});

////////////////////////

//////Type in a box and press enter to print a mirror 
//////in jquery of the text entered

////Answer:

  //Creates jquery autorefreshing text box next to input
$(document).ready(function() {
  $("#mirror").on("focus", function() {
    if (!$(this).val()) {
      $("#result").text("start typing..");
    } 
  });

  //Reverses inputted text, sending it to #result
  $("#mirror").on("keyup", function() {
    if(event.which === 9){
      return;
    }
    var backward = $(this).val().split("").reverse().join("");
    $("#result").text(backward);

  });
});

/////////////////////////



//Login jQuery
//Shows text to the user in real time of what they wrote
$(document).on("submit", "#personal-info", function(event){
  var result;
  result =  "First Name: " + $("#firstName").val() + " " + 
            "Last name Name: " + $("#lastName").val() + " " +
            "Email: " + $("#Email").val()
  $("#display").text(result);
  return false;
});




// $(document).on("keyup", "#mirror", function(event){


///////////////////////Understanding propagation in DOM:

$(document).ready(function() {

    $(".box1").click(function(){
      alert("box 1");
    });

    $(".box2").click(function(){
      alert("box 2");
      return false; //prevents upward DOM propagation & preventDefault
    });    

    $(".box3").click(function(){
      alert("box 3");
    });

  });


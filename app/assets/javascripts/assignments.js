// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

function addNewQuestionToForm() {
  $("#hidden_question_answer_section").clone().removeAttr("id").appendTo("#all_questions");
}

$(function(){
  $("button.add_question").click(function(){
    addNewQuestionToForm();
  })
})


$(function(){
  $("#datepicker").pickadate({
    // 2013-12-02 17:48:29 -0500
    format: 'yyyy-mm-dd'
  });
})

$(function(){
  $("#timepicker").pickatime({
    // 2013-12-02 17:48:29 -0500
    min: [8,00],
    max: [20,00],
    interval: 15
  });
})
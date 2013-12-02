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
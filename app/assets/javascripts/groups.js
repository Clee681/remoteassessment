function addNewStudentToForm() {
  $("#hidden_new_student_section").clone().removeAttr("id").appendTo("#all_students");
}

$(function(){
  $("button.new_student").click(function(){
    addNewStudentToForm();
  });
});
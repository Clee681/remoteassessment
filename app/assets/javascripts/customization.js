$(function() {
  $('.glyphicon').click(function(event){
    event.preventDefault();
    
    var student_id = $(this).parent().attr('id');
    var group_id = $(this).parentsUntil('.list-group').parent().first().attr('id');
    
    $.post( 'http://127.0.0.1:3000/remove-student-group', {
      'data': JSON.stringify([student_id, group_id])
    });

    $(this).parent().remove();
    $(this).remove();
  });
});
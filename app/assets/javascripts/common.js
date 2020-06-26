$(function(){
  $(".modal-submit").click(function(){
    $(this).closest(".modal-footer").prev(".modal-body").children("form").submit();
  })
});
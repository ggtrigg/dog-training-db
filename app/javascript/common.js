$(document).on("turbolinks:load", function() {
  $(".modal-submit").click(function(){
    Rails.fire($(this).closest(".modal-footer").prev(".modal-body").children("form")[0], 'submit');
  })
});
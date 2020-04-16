# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $("#client-notes").on("ajax:success", (event) ->
    [data, status, xhr] = event.detail
    $("#client-notes").append xhr.responseText
  ).on "ajax:error", (event) ->
    $("#client-notes").append "<p>ERROR</p>"
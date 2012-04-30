# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $("#is_chapter").change(()->
    if($(this).is(':checked'))
      $("#cat_select").hide()
    else
      $("#cat_select").show()
  )
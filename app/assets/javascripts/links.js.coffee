# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->

  url_exists = false

  ValidURL =(str)->
    regexp = /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/
    regexp.test(str);

  $("#link_url").keyup(()->
    url_input = $(this).val()
    if(ValidURL(url_input))
      $.ajax(
        url: '/links/get_title',
        data: { url: url_input}
        success: (data) ->
          console.log(data);
          if data.wrong_url
              $("#urlGroup").addClass("error")
              $("#urlGroup .controls").append('<span id="url_error" class="help-inline">Adresse introuvable</p>')
              url_exists = false
          else
              $("#urlGroup").removeClass("error")
              $("#url_error").remove()
              url_exists = true
          $("#link_name").val(data.url_title)
      )
  )

  $("form#new_link").submit(()->
    if(url_exists)
      if($("#link_name").val().length ==0 )
        $("#nameGroup").addClass("error")
      else
        $("#nameGroup").removeClass("error")
  )
$(document).ready ->
  # TODO: user menu works via CSS, must chekc if this code is used elsewhere
  # $(".open").on "click", (event) ->
  #  event.preventDefault()
  #  event.stopPropagation()
  #  $(@).parent().find("nav").toggle()
  $("input").click (event) ->
    event.stopPropagation()
  setTimeout (->
    $('#flash').slideDown('slow')
  ), 100
  setTimeout (->
    $('#flash').slideUp('slow')
  ), 16000
  $(window).on "click", ->
    $('#flash').slideUp('slow')
    # TODO: user menu works via CSS, must chekc if this code is used elsewhere
    # $('.open').parent().find("nav").hide()
  $('.money').maskMoney
    thousands: ''
    decimal: ''
    precision: 0

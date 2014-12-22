$(document).ready ->
  setTimeout (->
    $('#flash').slideDown('slow')
  ), 100
  setTimeout (->
    $('#flash').slideUp('slow')
  ), 16000
  $(window).on "click", ->
    $('#flash').slideUp('slow')
  $('.money').maskMoney
    thousands: ''
    decimal: ''
    precision: 0

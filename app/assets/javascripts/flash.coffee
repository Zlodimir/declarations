$ ->
  return if $('.alert').length == 0
  
  setTimeout (->
      $('.alert').fadeOut(400)
  ), 3000

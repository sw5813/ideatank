ready = ->
  updateCountdown()
  $("#micropost_content").change updateCountdown
  $("#micropost_content").keyup updateCountdown
  
updateCountdown = ->
  remaining = 500 - $("#micropost_content").val().length
  $(".countdown").text remaining + " characters remaining"

$(document).ready(ready)
$(document).on('page:load', ready)
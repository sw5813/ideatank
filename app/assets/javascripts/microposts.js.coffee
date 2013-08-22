jQuery ->
  updateCountdown()
  $("#micropost_content").change updateCountdown
  $("#micropost_content").keyup updateCountdown
  
updateCountdown = ->
  remaining = 500 - jQuery("#micropost_content").val().length
  jQuery(".countdown").text remaining + " characters remaining"


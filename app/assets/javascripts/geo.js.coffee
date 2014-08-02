
success = (position) ->
  $.cookie('location', {lat: position.coords.latitude, lng: position.coords.longitude})
error = (msg) ->
  console.log 'fail'
  console.log msg

@getUserLoation = ->
  if navigator.geolocation
    if !$.cookie('location')?
      navigator.geolocation.getCurrentPosition(success, error)
  else
    error 'not supported'

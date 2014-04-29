
success = (position) ->
  $.post('/location/set', {lat:position.coords.latitude , lng:position.coords.longitude })

error = (msg) ->
  s = $('#geolocate_error')
  s.html(typeof msg == 'string' ? msg : "failed")

window.getUserLocation = ->
  ###if navigator.geolocation
    navigator.geolocation.getCurrentPosition(success, error)
  else
    error 'not supported'###
  null
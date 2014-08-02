initialize = ->
  lat = $.cookie('location').lat
  lng = $.cookie('location').lng

  pyrmont = new google.maps.LatLng(lat,lng)
  map = new google.maps.Map(document.getElementById('map-canvas'), { center: pyrmont, zoom: 15 })

  request =
    location: pyrmont,
    radius: '1610',
    types: ['clothing_store']

  service = new google.maps.places.PlacesService(map)
  service.nearbySearch(request, callback)
  null

callback = (results, status)->
  if (status == google.maps.places.PlacesServiceStatus.OK)
    nearbyPlaces = $('#nearby-places')
    for result in results
      nearbyPlaces.append("<li class='list-group-item'> <a data-method='post' data-remote='true' href='/retailers?place_id=#{result.place_id}&name=#{result.name}'rel='nofollow'>#{result.name}</a></li>")

@getPlaces = ->
  initialize()
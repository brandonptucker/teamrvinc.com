$ -> 

  if $("#map_canvas").length > 0
    latLng = new google.maps.LatLng(31.518648, -84.113903)

    options = 
      zoom: 11,
      center: latLng,
      mapTypeId: google.maps.MapTypeId.ROADMAP

    map = new google.maps.Map(document.getElementById("map_canvas"), options);

    marker = new google.maps.Marker
      position: latLng,
      map: map

    $(window).resize ->
      map.setCenter(latLng)

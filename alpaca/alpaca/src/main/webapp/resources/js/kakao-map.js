
var kakao;

function init() {
    var myLatlng = new kakao.maps.LatLng(33.50972, 126.52194);
    
    var mapOptions = {
        // How zoomed in you want the map to start at (always required)
        zoom: 7,

        // The latitude and longitude to center the map (always required)
        center: myLatlng,

        // How you would like to style the map. 
        scrollwheel: false,
        styles: [
            {
                "featureType": "administrative.country",
                "elementType": "geometry",
                "stylers": [
                    {
                        "visibility": "simplified"
                    },
                    {
                        "hue": "#ff0000"
                    }
                ]
            }
        ]
    };

    

    // Get the HTML DOM element that will contain your map 
    // We are using a div with id="map" seen below in the <body>
    var mapElement = document.getElementById('map');

    // Create the kakao Map using out element and options defined above
    var map = new kakao.maps.Map(mapElement, mapOptions);
    
    var addresses = ['New York'];

    for (var x = 0; x < addresses.length; x++) {
        $.getJSON('http://maps.kakaoapis.com/maps/api/geocode/json?address='+addresses[x]+'&sensor=false', null, function (data) {
            var p = data.results[0].geometry.location
            var latlng = new kakao.maps.LatLng(p.lat, p.lng);
            new kakao.maps.Marker({
                position: latlng,
                map: map,
                icon: 'images/loc.png'
            });

        });
    }
    
}
kakao.maps.event.addDomListener(window, 'load', init);
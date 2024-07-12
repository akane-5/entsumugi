document.addEventListener("DOMContentLoaded", function() {
  function initMap() {
    const mapOptions = {
      center: { lat: 35.6895, lng: 139.6917 }, // 東京の座標
      zoom: 10
    };
    const mapElement = document.getElementById("map");
    if (mapElement) {
      const map = new google.maps.Map(mapElement, mapOptions);
    }
  }

  window.initMap = initMap;
});
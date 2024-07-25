document.addEventListener("DOMContentLoaded", function() {
  let map; // マップを外で宣言

  function initMap() {
    const mapOptions = {
      center: { lat: 35.6895, lng: 139.6917 }, // 東京の座標
      zoom: 10
    };

    const mapElement = document.getElementById("map");
    if (mapElement) {
      map = new google.maps.Map(mapElement, mapOptions); // ここでmapに代入
      addMarkers();
    }
  }

  function addMarkers() {
    const shrinesData = JSON.parse(document.getElementById('shrines-data').dataset.shrines);

    shrines.forEach(shrine => {
      const marker = new google.maps.Marker({
        position: { lat: shrine.latitude, lng: shrine.longitude }, // 緯度経度を設定
        map: map, // ここでmapを使用
        title: shrine.name
      });

      // ピンをクリックした時のイベントを設定
      const infoWindow = new google.maps.InfoWindow({
        content: `
          <div>
            <h3>${shrine.name}</h3>
            <img src="${shrine.photo_reference}" alt="${shrine.name}" style="width: 100px; height: auto;">
            <br>
            <a href="/shrines/${shrine.id}" class="detail-button">詳細</a>
          </div>
        `
      });

      marker.addListener("click", () => {
        infoWindow.open(map, marker); // ピンをクリックした時にウィンドウを表示
      });
    });
  }

  window.initMap = initMap;
});

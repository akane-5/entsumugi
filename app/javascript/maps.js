let map;

function initMap() {
  const mapOptions = {
    center: { lat: 35.1856, lng: 136.9032 }, // 名古屋の座標
    zoom: 8
  };

  map = new google.maps.Map(document.getElementById('map'), mapOptions);
  fetchShrinesData(map);// 神社データを取得する関数を呼び出し
}

async function fetchShrinesData(map) {
  try {
    const response = await fetch('/shrines/search_json'); // 神社データを取得
    const shrinesData = await response.json(); // JSON形式で変換
    addMarkers(map,shrinesData); // マーカーを追加する関数を呼び出し
  } catch (error) {
    console.error('Error fetching shrines data:', error);
  }
}

function addMarkers(map,shrinesData) {
  shrinesData.forEach(shrine => {
    const marker = new google.maps.Marker({
      position: { lat: shrine.latitude, lng: shrine.longitude },
      map: map,
      title: shrine.name
    });

    const infoWindow = new google.maps.InfoWindow({
      content: `
        <div class="p-4 max-w-s bg-background rounded-lg shadow-md">
          <h3 class="text-lg mb-2">${shrine.name}</h3>
          <img src="/assets/images/sample.jpg" alt="${shrine.name}" class="w-full h-full object-cover">
          <br>
          <a href="/shrines/${shrine.id}" class="block py-2 px-4 bg-navy text-white text-center rounded hover:opacity-75">詳細</a>
        </div>
      `
    });

    marker.addListener("click", () => {
      infoWindow.open(map, marker); // ピンをクリックした時にウィンドウを表示
    });
  });
}

window.initMap = initMap;

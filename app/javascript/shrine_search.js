document.addEventListener('DOMContentLoaded', () => {
  const shrineInput = document.getElementById('shrine_name');
  const shrineIdField = document.getElementById('shrine_id'); // hidden field for shrine_id
  const addressField = document.getElementById('address'); // 住所のinputフィールド
  const badgeContainer = document.getElementById('category-badge-container');

  if (shrineInput) {
    shrineInput.addEventListener('input', function () {
      const shrineName = this.value;

      fetch(`/shrines/shrine_search?name=${encodeURIComponent(shrineName)}`, {
        headers: {
          'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content
        }
      })
        .then(response => response.json())
        .then(data => {
          // shrine_id を更新
          if (data && data.id) {
            shrineIdField.value = data.id; // shrine_idを確実に設定
          } else {
            shrineIdField.value = ''; // データがない場合は空にする
          }

          // 住所の表示（データの存在確認）
          addressField.value = data.address || '住所が見つかりません';

          // カテゴリに応じたクラスを返す関数を追加
          function getBadgeClass(category) {
            switch (category) {
              case '総合運':
                return 'bg-blue opacity-70 text-black py-3';
              case '金運':
                return 'bg-yellow opacity-70 text-black py-3';
              case '恋愛運':
                return 'bg-pink opacity-70 text-black py-3';
              case '健康運':
                return 'bg-olive opacity-70 text-black py-3';
              case '仕事・学業運':
                return 'bg-purple opacity-70 text-black py-3';
              default:
                return 'bg-gray-300 text-black py-3'; // デフォルトのクラス
            }
          }
          // カテゴリの表示（データの存在確認）
          if (Array.isArray(data.categories)) {
            badgeContainer.innerHTML = ''; // 以前のバッジをクリア
            data.categories.forEach(category => {
              const badge = document.createElement('span');
              badge.className = getBadgeClass(category); // カテゴリに応じたクラスを取得
              badge.textContent = category;
              badgeContainer.appendChild(badge);
            });
          }
        })
        .catch(error => {
          console.error('Error fetching shrine data:', error); // エラーメッセージの確認
        });
    });
  }
});
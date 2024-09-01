class ShrinesController < ApplicationController
  def search
    # フォームからの検索
    @q = Shrine.ransack(params[:q])
    @shrines = @q.result(distinct: true)
  end

  def search_json
    # マップからの検索
    @shrines_data = Shrine.all.map do |shrine|
      {
        id: shrine.id,
        name: shrine.name,
        latitude: shrine.latitude,
        longitude: shrine.longitude,
        address: shrine.address,
        photo_url: shrine.formatted_photo_reference
      }
    end
    render json: @shrines_data
  end

  def index
    @q = Shrine.ransack(params[:q])
    @shrines = @q.result.page(params[:page]).per(9)
    @no_results = @shrines.empty? # 結果がない場合の表示
  end

  def show
    @shrine = Shrine.find(params[:id])
    @posts = @shrine.posts # 神社に関連する投稿を取得
    @no_results = @posts.empty? # 投稿がないかどうかを判定
  end

  # 新規投稿時に入力された神社名から神社データを探す
  def shrine_search
    shrine = Shrine.find_by(name: params[:name])
    if shrine
      categories = shrine.categories.pluck(:name) # カテゴリ名を配列で取得
      render json: { id: shrine.id, address: shrine.address, categories: categories }
    else
      render json: {}
    end
  end
end

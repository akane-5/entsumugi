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
  end
end

class ShrinesController < ApplicationController
  def search
    # フォームからの検索
    @q = Shrine.ransack(params[:q])
    @shrines = @q.result(distinct: true)
  end

  def search_json
    # マップからの検索
    @shrines_data = Shrine.select(:id, :name, :latitude, :longitude, :address) # 必要なカラムだけを取得
    render json: @shrines_data
  end

  def index
    @q = Shrine.ransack(params[:q])
    @shrines = @q.result.page(params[:page]).per(9)
  end

  def show
    @shrine = Shrine.find(params[:id])
  end
end

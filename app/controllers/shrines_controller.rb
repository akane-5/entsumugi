class ShrinesController < ApplicationController
  before_action :ransack_query, only: [:index, :search]

  # フォームからの検索
  def search
    @shrines = @q.result(distinct: true)
  end

  # マップからの検索
  def search_json
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
    # タグが選択されている場合は、選択されたカテゴリに該当する神社を絞り込む
    if params[:q][:category_id_in].present?
      @shrines = @q.result
        .includes(shrine_categories: :category)
        .joins(:shrine_categories) # shrine_categoriesテーブルと結合
        .where(shrine_categories: { category_id: params[:q][:category_id_in] })
        .distinct.page(params[:page]).per(9)
    else
      # タグが選択されていない場合は従来通りの検索結果を表示
      @shrines = @q.result.includes(shrine_categories: :category).page(params[:page]).per(9)
    end
    @no_results = @shrines.empty? # 結果がない場合の表示
  end

  def show
    @shrine = Shrine.find(params[:id])
    @categories = @shrine.shrine_categories.includes(:category) # カテゴリを関連づけて取得
    @posts = @shrine.posts # 神社に関連する投稿を取得
    @no_results = @posts.empty? # 投稿がないかどうかを判定
  end

  private

  def ransack_query
    @q = Shrine.ransack(params[:q])
  end

  def shrine_params
    params.require(:shrine).permit(:name, :prefecture_id, :address, :latitude, :longitude, :place_id, :photo_reference, :website, category_ids: [])
  end
end

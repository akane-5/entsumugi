class ShrinesController < ApplicationController
  # フォームからの検索
  def search
    @q = Shrine.ransack(params[:q])
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
    @q = Shrine.ransack(params[:q])

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

  # 神社登録フォームから神社情報取得のためのAPIリクエスト
  def api_request
    prefecture_id = params[:prefecture_id]
    shrine_name = params[:name]

    # 環境変数からAPIキーを取得
    api_key = ENV.fetch('PLACES_API_KEY')

    # APIリクエストを送信（例: RestClientやNet::HTTPを使う）
    response = RestClient.post(
      "https://api.example.com/shrines/search",
      {
        prefecture_id: prefecture_id,
        name: shrine_name
      },
      { Authorization: "Bearer #{api_key}", content_type: :json }
    )

    # レスポンスをJSON形式で返す
    render json: JSON.parse(response.body)
  rescue StandardError => e
    render json: { error: e.message }, status: :internal_server_error
  end

  # 神社登録フォームからDBに保存
  def create
    @shrine = Shrine.new(shrine_params)

    if @shrine.save
      render json: { success: true }
    else
      render json: { success: false, errors: @shrine.errors }, status: :unprocessable_entity
    end
  end

  private

  def shrine_params
    params.require(:shrine).permit(:name, :prefecture_id, :address, :latitude, :longitude, :place_id, :photo_reference, :website, category_ids: [])
  end
end

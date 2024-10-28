class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create] # ログインしているユーザーのみアクセス可能

  def index
    @posts = Post.all_users_posts # すべてのユーザーの投稿一覧を取得(モデルで定義)
    @posts = @posts.page(params[:page]).per(9)
  end

  def new
    @post = Post.new
    @shrines = Shrine.all # 神社データを取得する
    @categories = Category.all # カテゴリデータを取得する
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = '投稿が成功しました！'
      redirect_to posts_path
    else
      flash[:alert] = "投稿できませんでした"
      render :new
    end
  end

  # 新規投稿時に入力された神社名を元に取得したデータをJSONに変換する(データ取得ロジックのfind_shrine_for_postメソッドはShrineモデルで定義)
  def shrine_search
    shrine_data = Shrine.find_shrine_for_post(params[:name])
    render json: shrine_data
  end

  def destroy
    post = Post.find(params[:id])
    if post.destroy
      flash[:notice] = '投稿を削除しました'
    else
      flash[:alert] = "投稿を削除できませんでした"
    end
    redirect_to request.referer || users_path
  end

  private

  def post_params
    params.require(:post).permit(:shrine_id, :body, :image) # user_idは許可しない(current_userで取得)
  end
end

class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @post = Post.new
    @shrines = Shrine.all # 神社データを取得する
    @categories = Category.all # カテゴリデータを取得する
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = '投稿が成功しました！'
      redirect_to users_path
    else
      flash[:alert] = "投稿できませんでした"
      render :new
    end
  end

  private

  def post_params
    # user_id は許可しない（current_user で設定）
    params.require(:post).permit(:shrine_id, :body, :image)
  end
end

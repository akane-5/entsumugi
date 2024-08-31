class PostsController < ApplicationController
  def new
    @post = Post.new
    @shrines = Shrine.all  # 神社データを取得する
    @categories = Category.all  # カテゴリデータを取得する
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to users_path, notice: '投稿が成功しました！'
    else
      render :new
    end
  end

  private

  def post_params
    # user_id は許可しない（current_user で設定）
    params.require(:post).permit(:shrine_id, :body, :image)
  end
end

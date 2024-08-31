class UsersController < ApplicationController
  def show
    @user = current_user
    @posts = @user.posts
  end

  def profile
    render partial: 'profile'
  end

  def my_posts
    @user = current_user # 現在のユーザーを取得
    @posts = @user.posts  # ユーザーの投稿を取得
    @no_results = @posts.empty? # 投稿がないかどうかを判断
    render partial: 'my_posts'
  end
end

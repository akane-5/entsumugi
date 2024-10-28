class UsersController < ApplicationController
  before_action :set_user

  def show
    @posts = @user.posts
  end

  def profile
    render partial: 'profile'
  end

  def my_posts
    @posts = @user.my_posts_list # ユーザーの投稿を神社情報、カテゴリ情報を含めて降順で取得(モデルで定義)
    @no_results = @posts.empty? # 投稿がないかどうかを判断
    render partial: 'my_posts'
  end

  def bookmarks
    @bookmarks = @user.bookmarked_shrines_list # ブックマークした神社を取得するロジック(モデルで定義)
    @no_results = @bookmarks.empty? # 投稿がないかどうかを判断
    render partial: 'bookmarks'
  end

  private

  # 現在のユーザーを取得
  def set_user
    @user = current_user
  end
end

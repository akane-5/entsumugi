class BookmarksController < ApplicationController
  before_action :authenticate_user! # ログインしているユーザーのみアクセス可能
  before_action :set_shrine, only: [:create, :destroy]

  def create
    current_user.bookmarks.create(shrine: @shrine)
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @shrine }
    end
  end

  def destroy
    bookmark = current_user.bookmarks.find_by(shrine: @shrine)
    bookmark&.destroy
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @shrine }
    end
  end

  private

  def set_shrine
    @shrine = Shrine.find(params[:shrine_id])
  end
end

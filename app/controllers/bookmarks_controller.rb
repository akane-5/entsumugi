class BookmarksController < ApplicationController
  before_action :authenticate_user! # ログインしているユーザーのみアクセス可能

  def create
    @shrine = Shrine.find(params[:shrine_id])
    current_user.bookmarks.create(shrine: @shrine)
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @shrine }
    end
  end

  def destroy
    @shrine = Shrine.find(params[:shrine_id])
    bookmark = current_user.bookmarks.find_by(shrine: @shrine)
    bookmark&.destroy
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @shrine }
    end
  end
end

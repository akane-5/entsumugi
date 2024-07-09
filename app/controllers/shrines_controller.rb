class ShrinesController < ApplicationController
  def index
    @q = Shrine.ransack(params[:q])
    @shrines = @q.result.includes(:prefecture)
  end
end

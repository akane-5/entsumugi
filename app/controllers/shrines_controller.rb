class ShrinesController < ApplicationController
  def search
    @q = Shrine.ransack(params[:q])
  end

  def index
    @q = Shrine.ransack(params[:q])
    @shrines = @q.result
  end
end

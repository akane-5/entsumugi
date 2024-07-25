class ShrinesController < ApplicationController
  def search
    @q = Shrine.ransack(params[:q])
    @shrines = @q.result(distinct: true)
    @shrines_data = Shrine.all.to_json(only: [:id, :name, :latitude, :longitude, :address])
  end

  def index
    @q = Shrine.ransack(params[:q])
    @shrines = @q.result.page(params[:page]).per(6)
  end

  def show
    @shrine = Shrine.find(params[:id])
  end
end

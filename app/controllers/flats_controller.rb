class FlatsController < ApplicationController
  def index
    # @flats = Flat.where("city = ? AND capacity >= ?", params[:city].capitalize, params[:guests])
    @flats = Flat.near(params[:city].capitalize, 20)
    @markers = Gmaps4rails.build_markers(@flats) do |flat, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
    end
  end

  def show
    @flat = Flat.find(params[:id])
  end
end

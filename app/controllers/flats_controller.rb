class FlatsController < ApplicationController
  def index
    # @flats = Flat.where("city = ? AND capacity >= ?", params[:city].capitalize, params[:guests])
    @flats_location = Flat.near(params[:city].capitalize, 20)
    @flats = @flats_location.where("capacity >= ?", params[:guests])
    @markers = Gmaps4rails.build_markers(@flats) do |flat, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
      marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def show
    @flat = Flat.find(params[:id])
  end
end

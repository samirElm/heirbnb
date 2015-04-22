class FlatsController < ApplicationController
  def index
    @flats = Flat.where("city = ? AND capacity >= ?", params[:city], params[:guests])
  end

  def show
    @flat = Flat.find(params[:id])
  end
end

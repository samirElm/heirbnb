class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @flat_id = Flat.find(params[:flat_id])
  end

  private

  # TODO : add strong params to create
  # def booking_params
  #   params.require(:booking).permit(:check_out, :check_in)
  # end
end
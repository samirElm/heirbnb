class BookingsController < ApplicationController

  def index
    @bookings = []
    current_user.flats.each do |f|
      if f.bookings.size != 0
        f.bookings.each do |booking|
          @bookings << booking
        end
      end
    end
   @bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end

  # def edit
  #   @booking = Booking.find(params[:id])
  # end

  # def update
  #   @booking = Booking.find(params[:id])
  #   @booking.accepted = false
  #   @booking.save
  #   flash[:notice] = 'booking was successfully accepted.'
  #   redirect_to bookings_path
  # end

  # def create
  # end

  def new
    @booking = Booking.new
    @flat_id = (Flat.find(params[:flat_id]))[:id]
  end

  private

  # def booking_params
  #   params.require(:booking).permit(:accepted)
  # end
end
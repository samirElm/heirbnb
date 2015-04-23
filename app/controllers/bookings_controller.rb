class BookingsController < ApplicationController

  # def index
  #   @bookings = Booking.where(:flat_id == params[:flat_id])

  # end

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
     #  flat_id_array = []
     #  current_user.flats.each do |flat|
     #    flat_id_array << flat.id
     #    raise
     #  end


     #  @bookings = Booking.where(:flat_id => current_user.flats)


     #  if id_array.indclude? :flat_id
     #    @bookings << Booking.where(:flat_id)
     #    # @bookings = Booking.all

     # raise
  # end

  # def index
  #   @bookings = Booking.where( == current_user.id)

  # end

  def new
    @booking = Booking.new
    @flat_id = (Flat.find(params[:flat_id]))[:id]
  end

  private

  # TODO : add strong params to create
  # def booking_params
  #   params.require(:booking).permit(:check_out, :check_in)
  # end
end
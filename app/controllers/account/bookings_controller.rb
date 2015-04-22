module Account
  class BookingsController < Account::BaseController

    def index
      @bookings = Booking.all
    end

    def create
      @booking = current_user.bookings.build(check_out: params[:check_out], check_in: params[:check_in], flat_id: params[:flat_id])
      @booking.save
      if @booking.save
        redirect_to account_bookings_path
      else
        render :new
      end
    end
  end
end
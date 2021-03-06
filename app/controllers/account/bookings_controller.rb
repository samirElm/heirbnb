module Account
  class BookingsController < Account::BaseController

    def index
      @bookings = current_user.bookings.all
    end

    def create
      @booking = current_user.bookings.build(check_out: params[:check_out].gsub(/\//,'-'), check_in: params[:check_in].gsub(/\//,'-'), flat_id: params[:flat_id])
      @flat = Flat.find(params[:flat_id])
      @booking.price_cents = @flat.price_cents * (@booking.check_out - @booking.check_in)
      @booking.save

      if @booking.save
        redirect_to account_bookings_path
      else
        render :new
      end
    end

    def destroy
      @booking = Booking.find(params[:id])
      @booking.destroy
      redirect_to account_bookings_path
    end
  end
end
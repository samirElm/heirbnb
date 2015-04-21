module Account
  class FlatsController < Account::BaseController
    def new
      @flat = current_user.flats.build
    end

    def create
      @flat = current_user.flats.build(flat_params)

      if @flat.save
        redirect_to flat_path(@flat)
      else
        render :new
      end
    end

    def edit
    end

    def update
    end

    def destroy
      @flat = current_user.flats.find(params[:id])
      @flat.destroy
      redirect_to flat_path(@flat)
    end

    private

    def flat_params
      params.require(:flat).permit(:title, :description)

    end
  end
end
module Account
  class FlatsController < Account::BaseController

    def index
      @flats = current_user.flats.all
    end

    def new
      @flat = current_user.flats.build
      3.times {@flat.flat_images.build}
    end

    def create
      @flat = current_user.flats.build(flat_params)

      if @flat.save
        redirect_to flat_path(@flat)
      else
        (3 - @flat.flat_images.count).times { @flat.flat_images.build }
        render :new
      end
    end

    def edit
      @flat = current_user.flats.find(params[:id])
      3.times {@flat.flat_images.build}
    end

    def update
      @flat = current_user.flats.find(params[:id])

      if @flat.update(flat_params)
        flash[:notice] = 'flat was successfully updated.'
        redirect_to flat_path
      else
        render "edit"
      end
    end

    def destroy
      @flat = current_user.flats.find(params[:id])
      @flat.destroy
      redirect_to flats_path
    end

    private

    def flat_params
      params.require(:flat).permit(:title, :description, :city, :capacity, :price,flat_images_attributes: [:picture])
    end
  end
end
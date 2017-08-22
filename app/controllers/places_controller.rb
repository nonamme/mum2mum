class PlacesController < ApplicationController
  def list
  end

  def show
    @place = Place.find params[:id]
    render 'place'
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)

    if @place.save
      redirect_to root_path
    else
      render new_place_path
    end
  end

  private
    def place_params
      params.require(:place).permit(:name, :city, :local_no, :street, :post_code, :link, :open_hours, :description, :image)
    end
end

class PlacesController < ApplicationController
  def list
  end

  def show
    @place = Place.find params[:id]
    render 'place'
  end

  def new
  end

  def create
    place = Place.new(place_params)

    if place.save
      @place = Place.last
      redirect_to 'show_place'
    else
      redirect_to 'home'
    end
  end

  private
    def place_params
      params.require(:place).permit(:name, :city, :local_no, :street, :post_code, :link, :open_hours)
    end
end

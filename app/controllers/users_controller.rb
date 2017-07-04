class UsersController < ApplicationController
  before_action :logged, :only => [:index, :new, :login]
  before_action :getUsersLocations, :only => [:index, :home]

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params) 
    if @user.save
      success_register_message_redirect_root
    else
      failed_register_message_render_new
    end
  end

  def error
    flash[:notice] = "No such a path"
    redirect_to root_path
  end

  def home
    @user = User.find_by :id => session[:id]
  end

  def update
   @user = User.find(session[:id]) 
   if @user.update(user_params)
     flash[:notice] = "Updated successfully!"
     redirect_to home_path
   else
     flash[:error] = "Can not update data. Sorry, try again later."
     redirect_to home_path
   end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   images_attributes: [:image_link, :image_description],
                                   address_attributes: [:id, :city, :street, :home_number, :post_code, :country])
    end

    def success_register_message_redirect_root
      flash[:notice] = "Registered successfully!"
      redirect_to root_path
    end

    def failed_register_message_render_new
      flash[:error] = "You can not register yourself right now! Sorry."
      render 'new'
    end

    def logged
      if session[:id] != nil
        redirect_to home_path
      end
    end

    def getUsersLocations
      @addresses = Address.all
      @hash = Gmaps4rails.build_markers(@addresses) do |address, marker|
        marker.lat address.latitude
        marker.lng address.longitude
      end
    end
end

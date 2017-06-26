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

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   images_attributes: [:image_link, :image_description],
                                   address_attributes: [:city, :street, :home_number, :post_code, :country])
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
    @users = Address.all
      @hash = Gmaps4rails.build_markers(@users) do |user, marker|
        marker.lat user.latitude
        marker.lng user.longitude
      end
    end
end

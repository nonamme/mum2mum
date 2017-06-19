class UsersController < ApplicationController
  before_action :logged, :only => [:index, :new, :login]

  def index
  end

  def new
    @user = User.new
    @user.build_address
    @user.images.build
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
        redirect_to users_home_path
      end
    end
end

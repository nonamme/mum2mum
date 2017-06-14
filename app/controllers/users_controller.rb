class UsersController < ApplicationController
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
      display_success_message_redirect_root
    else
      display_failed_message_redirect_root
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   images_attributes: [:image_link, :image_description],
                                   address_attributes: [:city, :street, :home_number, :post_code, :country])
    end

    def display_success_message_redirect_root
      flash[:notice] = "Registered successfully!"
      redirect_to root_path
    end

    def display_failed_message_redirect_root
      flash[:error] = "You can not register yourself right now! Sorry."
      render 'new'
    end
end

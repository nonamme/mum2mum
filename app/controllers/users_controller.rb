class UsersController < ApplicationController
  before_action :logged, :only => [:index, :new, :login]

  def index
    @user = @user || User.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params) 
    if @user.valid?
      @user.social = Social.new
      @user.social.save
      @user.save
      success_register_message_redirect_root
    else
      @user = User.new(user_params)
      failed_register_message_render_new
    end
  end

  def error
    not_found
    # render '/public/404.html'
  end

  def links
    render 'users/links'
  end

  def home
  end

  def edit
    @user = User.find_by :id => session[:id]
    render 'users/update'
  end

  def update
   @user = User.find(session[:id]) 

   if @user.update!(user_params)
     flash[:notice] = "Updated successfully!"
     redirect_to show_profile_path session[:id]
   else
     flash[:error] = "Can not update data. Sorry, try again later."
     redirect_to show_profile_path session[:id]
   end
  end

  private
    def user_params
      params.require(:user).permit(:id, :name, :email, :password, :password_confirmation, :status, :image,
                                   address_attributes: [:id, :city, :street, :home_number, :post_code, :country])
    end

    def success_register_message_redirect_root
      flash[:notice] = "Registered successfully!"
      redirect_to root_path
    end

    def failed_register_message_render_new
      flash[:error] = "You can not register yourself right now! Sorry."
      render 'index'
    end

    def logged
      if session[:id] != nil
        redirect_to show_profile_path session[:id]
      end
    end
end

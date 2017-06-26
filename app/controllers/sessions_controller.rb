class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by email: params[:sessions][:email]

   if @user && params[:sessions][:password] === @user.password
      session[:id] = @user.id
      success_login
    else
      failed_login
    end
  end

  def destroy
    session[:id] = nil
    redirect_to root_path
  end

  private
    def success_login
      flash[:notice] = "Successfully logged in"
      redirect_to home_path
    end

    def failed_login
      flash[:error] = "Invalid combination user/password"
      redirect_to root_path
    end
end

class MomsController < ApplicationController
  def nearby
    @user = User.find session[:id]
    @users = User.joins(:address).where(:addresses => { :city => @user.address.city})
  end

  def listAllMums
    @mums = User.all
  end

  def showProfile
    @user = User.find params[:id]
    @comments = Comment.where commenter_id: params[:id]
    render 'moms/show'
  end
end

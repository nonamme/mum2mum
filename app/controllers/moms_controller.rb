class MomsController < ApplicationController
  def nearby
    @user = Address.find_by :user_id => session[:id]

    @users = Address.near([@user.latitude, @user.longitude], 20)

    @hash = Gmaps4rails.build_markers(@users) do | user, marker |
      marker.lat user.latitude
      marker.lng user.longitude
    end
  end

  def listAllMums
    @mums = User.all
  end
end

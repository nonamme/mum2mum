class SocialsController < ApplicationController
  def edit
    @social = Social.find_by :user_id => session[:id]
  end

  def update
  end
end

class SocialsController < ApplicationController
  def edit
    @social = Social.find_by :user_id => session[:id]
  end

  def update
    socials = Social.find_by user_id: session[:id]

    if socials.update(socials_params)
      redirect_to show_profile_path session[:id]
    else
      redirect_to socials_edit_path
    end
  end

  private
    def socials_params
      params.require(:social).permit(:facebook, :twitter, :instagram)
    end
end

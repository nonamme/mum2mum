class SocialsController < ApplicationController
  def edit
    @social = Social.find_by :user_id => session[:id]
  end

  def update
    @social = Social.find_by user_id: session[:id]

    if @social.update(socials_params)
      redirect_to show_profile_path session[:id]
    else
      render socials_edit_path
    end
  end

  private
    def socials_params
      params.require(:social).permit(:facebook, :twitter, :instagram)
    end
end

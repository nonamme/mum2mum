class NewsletterController < ApplicationController

  layout false

  def create
    @member = Newsletter.new(member_params)
    if @member.save
      successfully_member_signed_up
    else
      failed_member_signed_up
    end
  end

  private
    def member_params
      params.require(:newsletter).permit(:email)
    end

    def successfully_member_signed_up
      flash[:notice] = "Thank you. You successfully sign up to be our member."
      redirect_to root_path
    end

    def failed_member_signed_up
      flash[:error] = "You can not sign up right now! Please try again later."
      redirect_to root_path
    end
end

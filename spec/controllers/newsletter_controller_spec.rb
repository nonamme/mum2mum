require 'rails_helper'

RSpec.describe NewsletterController, :type => :controller do
  describe "POST #create" do
    it "responds with 302 pass" do
      post :create,  params: { :newsletter => { :email => 'email@com.com'}}

      expect(response).to have_http_status(302)
      expect(flash[:notice]).to match(/Thank you. You successfully sign up to be our member./)
      expect(response).to redirect_to root_path
    end
  end
end

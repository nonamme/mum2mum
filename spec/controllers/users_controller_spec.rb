require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET index" do
    render_views
    it "has a 200 status" do
      get :index
      expect(response.status).to eq(200)
    end

    it "reneds index view" do
      get :index
      expect(response).to render_template("index")
    end
  end
  
  describe "GET login form" do
    render_views
    before :each do
      get :new
    end

    it "go to login form" do
      expect(response.status).to eq(200)
    end

    it "get the form" do
      expect(response.body).to match /form/
    end
  end

  describe "POST create user" do
    render_views
    before :each do
      post :create, params: { :user => { :name => "Test", :email => "test@test.com"}}
    end
    it "redirect to index page" do
      expect(response).to have_http_status (302)
    end
  end
end

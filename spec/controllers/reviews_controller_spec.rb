require 'rails_helper'

describe ReviewsController do

  before do
    @movie = Movie.create!(movie_attributes)
  end

  context "when not signed in" do

    before do
      session[:user_id] = nil
    end

    it "cannot navigate to index" do
      get :index, params: { movie_id: @movie }

      expect(response).to redirect_to(new_session_url)
    end

    it "cannont navigate to new" do
      get :new, params: { movie_id: @movie }

      expect(response).to redirect_to(new_session_url)
    end

    it "cannot create a movie" do
      post :create, params: { movie_id: @movie }

      expect(response).to redirect_to(new_session_url)
    end


  end
end

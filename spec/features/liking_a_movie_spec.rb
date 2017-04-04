require 'rails_helper'

describe "Liking a movie" do
  before do
    @user = User.create!(user_attributes)
    sign_in(@user)
  end

  it "creates a liked for the signed-in user and shows the Unlike button" do
    movie = Movie.create!(movie_attributes)

    visit movie_url(movie)

    expect(page).to have_text("0 like")

    expect {
      click_button 'Like'
    }.to change(@user.likes, :count).by(1)

    expect(current_path).to eq(movie_path(movie))

    expect(page).to have_text("Thanks for liking!")
    expect(page).to have_text("1 fan")
    expect(page).to have_button("Unlike")
  end
end

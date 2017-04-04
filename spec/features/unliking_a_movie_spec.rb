require 'rails_helper'

describe "Unliking a movie" do
  before do
    @user = User.create!(user_attributes)
    sign_in(@user)
  end

  it "deletes the like and shows the Like button" do
    movie = Movie.create!(movie_attributes)

    visit movie_url(movie)
    click_button 'Like'

    expect(page).to have_text("1 Fan")

    expect {
      click_button 'Unlike'
    }.to change(@user.likes, :count).by(-1)

    expect(current_path).to eq(movie_path(movie))

    expect(page).to have_text("Yes, you unliked it!")
    expect(page).to have_text("0 fans")
    expect(page).to have_button("Like It")
  end

end

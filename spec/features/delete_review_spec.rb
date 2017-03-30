require 'rails_helper'

describe "Deleting a review" do

  before do
    @user = User.create!(user_attributes)
    sign_in(@user)
  end

  it "destroys the review and shows the movie listing without the review" do
    movie = Movie.create(movie_attributes(title: "Iron Man"))
    review1 = movie.reviews.create(review_attributes(user_id: @user.id))
    review2 = movie.reviews.create(review_attributes(user_id: @user.id))

    visit movie_reviews_url(movie)

    expect(page).to have_text(review1.user.name)
    expect(page).to have_text(review2.user.name)

    click_link "review_#{review1.id}_delete"

    expect(current_path).to eq(movie_reviews_path(movie))

    expect(page).to have_text("Review successfully deleted!")
    expect("#container").not_to have_text(review1.user.name)
  end
end

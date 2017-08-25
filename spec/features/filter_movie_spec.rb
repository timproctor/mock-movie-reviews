require 'rails_helper'

describe "Filtering movies" do
  it "shows hit movies" do
    movie = Movie.create!(movie_attributes(released_on: 1.day.ago, total_gross: 300_000_000))

    visit movies_url

    click_link "Hits"

    expect(current_path).to eq("/movies/filter/hits")

    expect(page).to have_text(movie.title)

  end
end

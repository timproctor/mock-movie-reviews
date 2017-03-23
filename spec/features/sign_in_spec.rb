require 'rails_helper'

describe "Signing in" do

  it "prompts for an email and password" do
    visit root_url

    click_link 'Sign In'

    expect(current_path).to eq(new_session_path)

    expect(page).to have_field("Email")
    expect(page).to have_field("Password")
  end

  it "signs in the user if the email/password combination is valid" do
    visit root_url

    click_link 'Sign In'

    user = default_user

    fill_in "Email", with: "default@example.com"
    fill_in "Password", with: "supersecret"

    within '#container' do
      click_on 'Sign In'
    end

    expect(page).to have_link("Default")
    expect(page).not_to have_link('Sign In')
    expect(page).not_to have_link('Sign Up')
  end

end

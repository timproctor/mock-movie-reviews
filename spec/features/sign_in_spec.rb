require 'rails_helper'

describe "Signing in" do

  it "signs in the user if the email/password combination is valid" do
    visit root_url

    click_link 'Sign In'

    expect(current_path).to eq(new_session_path)
    expect(page).to have_field("Email")
    expect(page).to have_field("Password")

    user = user_attributes[:name]
    expect(page).to have_link(user)
    expect(page).not_to have_link('Sign In')
    expect(page).not_to have_link('Sign Up')
  end

  it "does not sign in the user if the email/password combination is invalid" do
    visit root_url

    click_link 'Sign In'

    expect(current_path).to eq(new_session_path)
    expect(page).to have_field("Email")
    expect(page).to have_field("Password")

    user = user_attributes[:name]
    expect(page).not_to have_link(user)
    expect(page).to have_link('Sign In')
    expect(page).to have_link('Sign Up')
  end

end

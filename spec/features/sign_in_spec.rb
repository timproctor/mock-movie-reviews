require 'rails_helper'

describe "Signing in" do
  before do
    create_user
  end


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

    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "secret"

    within '#container' do
      click_on 'Sign In'
    end

    expect(page).to have_link("Example User")
    expect(page).not_to have_link('Sign In')
    expect(page).not_to have_link('Sign Up')
  end

  it "does not sign in the user if the email/password combination is invalid" do
    visit root_url

    click_link 'Sign In'

    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "nomatch"

    within '#container' do
      click_on 'Sign In'
    end

    expect(page).not_to have_link("Example User")
    expect(page).to have_link('Sign In')
    expect(page).to have_link('Sign Up')
end

end

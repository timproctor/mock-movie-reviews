def sign_in(user)
  visit new_session_url
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Sign In"
end

def create_user
  @user = User.create!(user_attributes)
end

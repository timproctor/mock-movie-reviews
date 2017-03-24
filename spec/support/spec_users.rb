def default_user
  user = User.new(name: "Default", email: "default@example.com",
          password: "supersecret", password_confirmation: "supersecret")
  user.save
end

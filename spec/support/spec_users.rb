def default_user
  default_user ||= User.new(name: "Default", email: "default@example.com",
                          password: "supersecret", password_confirmation: "supersecret")
  default_user.save
end

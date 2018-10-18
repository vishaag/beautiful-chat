User.create!(name:  "Vishaag",
             email: "vishaag@beautifulcode.com",
             password:              "foobar",
             password_confirmation: "foobar")


10.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@beautifulcode.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

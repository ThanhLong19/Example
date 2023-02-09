
19.times do |n|
  name = Faker::Name.name
  email = "example#{n + 1}@gmail.com"
  birthday = "2001-01-19"
  address = "Thanh Oai - Hà Nội"
  password = "password"
  User.create!(name: name,
               email: email,
               birthday: birthday,
               address: address,
               password: password,
               password_confirmation: password)
end
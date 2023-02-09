User.create!(name: "Thành Long",
             email: "long1901@gmail.com",
             birthday: "2001-01-19",
             address: "Thanh Oai - Hà Nội",
             password: "long1901",
             password_confirmation: "long1901",
             role: 1)

User.create!(name: "Long Phạm",
             email: "longp2k1@gmail.com",
             birthday: "2001-01-19",
             address: "Thanh Oai - Hà Nội",
             password: "long1901",
             password_confirmation: "long1901")

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
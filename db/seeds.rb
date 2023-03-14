10.times do |n|
  content = Faker::Lorem.sentence(word_count: 15)
  Task.create!(content: content)
end

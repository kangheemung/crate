# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = []
10000.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  password = Faker::Internet.password(min_length: 8)
  password_digest = BCrypt::Password.create(password) # Generate password digest
  user = { name: name, email: email, password_digest: password_digest } # Updated attribute name
  users << user
  puts "#{n + 1} create done"
end

User.insert_all(users)

microposts = []
users.each_with_index do |_user, user_index|
  10000.times do
    title = Faker::Lorem.sentence(word_count: 5)
    body = Faker::Lorem.sentence(word_count: 100)
    micropost = { title: title, body: body, user_id: user_index + 1 }
    microposts << micropost
  end
end

Micropost.insert_all(microposts)



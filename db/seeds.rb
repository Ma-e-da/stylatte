# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#ユーザー

User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated:    true,
             activated_at: Time.zone.now,
             stylist: false)
User.create!(name:  "Lee",
             email: "lee@example.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: false,
             activated:    true,
             activated_at: Time.zone.now,
             stylist: true)
User.create!(name:  "Hanako Yamada",
             email: "hyamada@example.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: false,
             activated:    true,
             activated_at: Time.zone.now,
             stylist: true)

30.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
             email: email,
             password:              password,
             password_confirmation: password,
             activated:    true,
             activated_at: Time.zone.now)
           end

#ポスト

 users = User.order(:created_at).take(6)
   10.times do
     content = Faker::Lorem.sentence(5)
     users.each { |user| user.posts.create!(content: content) }
           end


# リレーションシップ

  users = User.all
  user  = users.first
  following = users[2..30]
  followers = users[3..20]
  following.each { |followed| user.follow(followed) }
  followers.each { |follower| follower.follow(user) }

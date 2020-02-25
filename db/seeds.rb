# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
  user_name: 'admin',
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password'
)

3.times do
  Post.create!(
    title: 'WOW10.05「ナチュラルジャンプDoggyの挑戦」',
    youtube_url: 'https://youtu.be/XFsAAiB8foo',
    user_id: '1'
  )
end
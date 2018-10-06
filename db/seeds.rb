# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create! email:"hoangtuyb96@gmail.com", name:"Hoang Anh Tu", password: "12345678"

10.times do
  User.create!(
    email: Faker::Internet.unique.email,
    name: "Meo D." + Faker::OnePiece.character,
    password: "12345678",
    is_admin: true
  )
end

100.times do
  User.create!(
    email: Faker::Name.unique.first_name+"@gmail.com",
    name: "Meo D." + Faker::OnePiece.character,
    password: "12345678"
  )
end

5.times do
  Brand.create!(
    name: Faker::Device.unique.manufacturer
  )
end

100.times do
  Review.create!(
    name: Faker::Device.model_name,
    picture: Faker::Avatar.image,
    os: Faker::Device.platform,
    brand_id: 1 + rand(5),
    user_id: 1 + rand(20),
    review: Faker::GameOfThrones.quote * 2,
    price: (5000000 + rand(20000000)).to_s + "VND",
    is_confirm: [true, false].sample
  )
end

1000.times do
  Comment.create!(
    content: Faker::OnePiece.quote,
    review_id: 1 + rand(20),
    user_id: 1 + rand(100)
  )
end

20.times do
  Like.create!(
    user_id: 1 + rand(10),
    review_id: 1 + rand(100)
  )
end

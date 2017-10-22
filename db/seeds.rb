# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# admin_user
User.create!(
 id: 1 ,
 email: "takuya@gmail.com",
 password: "q123456789",
 roles: "admin")

 # admin_user
 User.create!(
 id: 2 ,
 email: "kevin@gmail.com",
 password: "q123456789",
 roles: "admin")

# nomal_user
User.create!(
id: 3 ,
email: "omar@gmail.com",
password: "q123456789",
roles: "user")


100.times do |product|
  Product.create!(
   photo: File.open(Rails.root+"app/assets/images/nipple.jpg"),
   description: "Lansinoh HPA LANOLIN - 100% ultra pure lanolin
  100% ultra pure lanolin for sore, cracked nipples
  Soothes, heals and protects sore, cracked nipples
  100% ultra pure lanolin - no preservatives or additives - all natural
  Clinically proven to accelerate healing
  So pure that there is no need to remove before breastfeeding",
   price: 100 ,
  )
end


@products = Product.all
@products.each do |product|
   product.reviews.create!(
   rating: (1..5).to_a.sample,
   comment: "I use this product as a base coat when sunbathing and have fair skin and it always protects my skin, I apply a higher factor over it during the day if the weather is very hot and always feel protected as the sun gets hotter",
   user_id: 1,
  )
end

@products.each do |product|
   product.reviews.create!(
   rating: (1..5).to_a.sample,
   comment: "I use this product as a base coat when sunbathing and have fair skin and it always protects my skin, I apply a higher factor over it during the day if the weather is very hot and always feel protected as the sun gets hotter",
   user_id: 2,
  )
end

@products.each do |product|
   product.reviews.create!(
   rating: (1..5).to_a.sample,
   comment: "I use this product as a base coat when sunbathing and have fair skin and it always protects my skin, I apply a higher factor over it during the day if the weather is very hot and always feel protected as the sun gets hotter",
   user_id: 2,
  )
end

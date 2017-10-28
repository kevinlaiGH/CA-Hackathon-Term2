# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# admin_user
User.create!( id: 1 , email: "takuya@gmail.com",password: "q123456789", roles: "admin")
User.create!( id: 2 , email: "kevin@gmail.com", password: "q123456789", roles: "admin")
User.create!( id: 3 , email: "omar@gmail.com", password: "q123456789", roles: "user")

# category
# Category.create!(name: "book")
# Category.create!(name: "dvd" )
# Category.create!(name: "cosmetic")


# product
Product.create!(
   photo: File.open(Rails.root+"app/assets/images/books/book1.jpg"),
   description: "LActress Kathy Najimy described her character Mary as Eddie Haskell as a witch, referring to the character on the classic TV series Leave It To Beaver. She sucks up to Winifred Bette Midler's character every chance she gets. She wants to be part of the power club and Winifred's got the power.To create the costumes, designer Mary Vogt read many historical books about Salem, Massachusetts. I even read diaries of women who were hanged as witches,she says.",
   price: 20,
  #  category: 1
  )
Product.create!(
   photo: File.open(Rails.root+"app/assets/images/books/book2.jpg"),
   description: "LActress Kathy Najimy described her character Mary as Eddie Haskell as a witch, referring to the character on the classic TV series Leave It To Beaver. She sucks up to Winifred Bette Midler's character every chance she gets. She wants to be part of the power club and Winifred's got the power.To create the costumes, designer Mary Vogt read many historical books about Salem, Massachusetts. I even read diaries of women who were hanged as witches,she says.",
   price: 20,
  #  category: 1
  )
Product.create!(
   photo: File.open(Rails.root+"app/assets/images/books/book3.jpg"),
   description: "LActress Kathy Najimy described her character Mary as Eddie Haskell as a witch, referring to the character on the classic TV series Leave It To Beaver. She sucks up to Winifred Bette Midler's character every chance she gets. She wants to be part of the power club and Winifred's got the power.To create the costumes, designer Mary Vogt read many historical books about Salem, Massachusetts. I even read diaries of women who were hanged as witches,she says.",
   price: 20,
  #  category: 1
  )
Product.create!(
   photo: File.open(Rails.root+"app/assets/images/books/book4.jpg"),
   description: "LActress Kathy Najimy described her character Mary as Eddie Haskell as a witch, referring to the character on the classic TV series Leave It To Beaver. She sucks up to Winifred Bette Midler's character every chance she gets. She wants to be part of the power club and Winifred's got the power.To create the costumes, designer Mary Vogt read many historical books about Salem, Massachusetts. I even read diaries of women who were hanged as witches,she says.",
   price: 20,
  #  category: 1
  )
Product.create!(
   photo: File.open(Rails.root+"app/assets/images/books/book5.jpg"),
   description: "LActress Kathy Najimy described her character Mary as Eddie Haskell as a witch, referring to the character on the classic TV series Leave It To Beaver. She sucks up to Winifred Bette Midler's character every chance she gets. She wants to be part of the power club and Winifred's got the power.To create the costumes, designer Mary Vogt read many historical books about Salem, Massachusetts. I even read diaries of women who were hanged as witches,she says.",
   price: 20,
  #  category: 1
  )
# dvd
Product.create!(
   photo: File.open(Rails.root+"app/assets/images/dvd/dvd1.jpg"),
   description: "LActress Kathy Najimy described her character Mary as Eddie Haskell as a witch, referring to the character on the classic TV series Leave It To Beaver. She sucks up to Winifred Bette Midler's character every chance she gets. She wants to be part of the power club and Winifred's got the power.To create the costumes, designer Mary Vogt read many historical books about Salem, Massachusetts. I even read diaries of women who were hanged as witches,she says.",
   price: 20,
  #  category: 2
  )
Product.create!(
   photo: File.open(Rails.root+"app/assets/images/dvd/dvd2.jpg"),
   description: "LActress Kathy Najimy described her character Mary as Eddie Haskell as a witch, referring to the character on the classic TV series Leave It To Beaver. She sucks up to Winifred Bette Midler's character every chance she gets. She wants to be part of the power club and Winifred's got the power.To create the costumes, designer Mary Vogt read many historical books about Salem, Massachusetts. I even read diaries of women who were hanged as witches,she says.",
   price: 20,
  #  category: 2
  )
Product.create!(
   photo: File.open(Rails.root+"app/assets/images/dvd/dvd3.jpg"),
   description: "LActress Kathy Najimy described her character Mary as Eddie Haskell as a witch, referring to the character on the classic TV series Leave It To Beaver. She sucks up to Winifred Bette Midler's character every chance she gets. She wants to be part of the power club and Winifred's got the power.To create the costumes, designer Mary Vogt read many historical books about Salem, Massachusetts. I even read diaries of women who were hanged as witches,she says.",
   price: 20,
  #  category: 2
  )
Product.create!(
   photo: File.open(Rails.root+"app/assets/images/dvd/dvd4.jpg"),
   description: "LActress Kathy Najimy described her character Mary as Eddie Haskell as a witch, referring to the character on the classic TV series Leave It To Beaver. She sucks up to Winifred Bette Midler's character every chance she gets. She wants to be part of the power club and Winifred's got the power.To create the costumes, designer Mary Vogt read many historical books about Salem, Massachusetts. I even read diaries of women who were hanged as witches,she says.",
   price: 20,
  #  category: 2
  )
Product.create!(
   photo: File.open(Rails.root+"app/assets/images/dvd/dvd5.jpg"),
   description: "LActress Kathy Najimy described her character Mary as Eddie Haskell as a witch, referring to the character on the classic TV series Leave It To Beaver. She sucks up to Winifred Bette Midler's character every chance she gets. She wants to be part of the power club and Winifred's got the power.To create the costumes, designer Mary Vogt read many historical books about Salem, Massachusetts. I even read diaries of women who were hanged as witches,she says.",
   price: 20,
  #  category: 2
  )

10.times do |product|
Product.create!(
   photo: File.open(Rails.root+"app/assets/images/nipple.jpg"),
   description: "Lansinoh HPA LANOLIN - 100% ultra pure lanolin
  100% ultra pure lanolin for sore, cracked nipples
  Soothes, heals and protects sore, cracked nipples
  100% ultra pure lanolin - no preservatives or additives - all natural
  Clinically proven to accelerate healing
  So pure that there is no need to remove before breastfeeding",
   price: 100 ,
  #  category: 3
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

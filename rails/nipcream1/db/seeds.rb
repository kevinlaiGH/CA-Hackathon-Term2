# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


10.times do |product|
  Product.create!(
   photo: File.open(Rails.root+"app/assets/images/nipple.jpg"),
   description: "Lansinoh HPA LANOLIN - 100% ultra pure lanolin
  100% ultra pure lanolin for sore, cracked nipples
  Soothes, heals and protects sore, cracked nipples
  100% ultra pure lanolin - no preservatives or additives - all natural
  Clinically proven to accelerate healing
  So pure that there is no need to remove before breastfeeding",
   price: 100
  )
end

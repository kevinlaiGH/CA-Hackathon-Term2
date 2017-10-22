class Product < ApplicationRecord

  mount_uploader :photo, ProductPhotoUploader

  has_many :reviews

  has_many :cart_items # just the 'relationships'
  

end

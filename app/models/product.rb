class Product < ApplicationRecord

  mount_uploader :photo, ProductPhotoUploader

  has_many :reviews

end

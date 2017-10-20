class Product < ApplicationRecord

  mount_uploader :photo, ProductPhotoUploader

end

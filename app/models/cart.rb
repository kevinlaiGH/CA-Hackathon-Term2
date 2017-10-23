class Cart < ApplicationRecord

  has_many :cart_items
  has_many :products, through: :cart_items

  def total_price
     cart_items.map { |cart_items| cart_items.quantity * cart_items.product.price }.sum
  end
  

end

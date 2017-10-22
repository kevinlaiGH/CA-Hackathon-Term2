class CreateCartItems < ActiveRecord::Migration[5.1]
  def change
    create_table :cart_items do |t|
      t.integer :quantity, default: 0 
      t.references :product, foreign_key: true
      t.references :cart, foreign_key: true

      t.timestamps
    end
  end
end

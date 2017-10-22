class AddStatusToCart < ActiveRecord::Migration[5.1]
  def change
    add_column :carts, :status, :string
  end
end

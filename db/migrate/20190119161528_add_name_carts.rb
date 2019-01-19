class AddNameCarts < ActiveRecord::Migration[5.1]
  def change
    add_column :carts, :name, :string
  end
end

class AddIndexToCart < ActiveRecord::Migration[5.1]
  def change
    add_index :carts, :name, unique: true
  end
end

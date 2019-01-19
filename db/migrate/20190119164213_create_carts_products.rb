class CreateCartsProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :carts_products do |t|
      t.references :product, foreign_key: true
      t.references :cart, foreign_key: true
      t.integer :amount
      t.timestamps
    end
  end
end

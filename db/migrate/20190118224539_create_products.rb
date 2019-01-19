class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.integer :inventory
      t.belongs_to :cart, index: true
      t.timestamps
    end
  end
end

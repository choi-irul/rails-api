class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.references :order, foreign_key: true
      t.references :cart, foreign_key: true
      t.references :product, foreign_key: true
      t.references :variant, foreign_key: true
      t.string :title
      t.integer :quantity
      t.decimal :price, precision: 12, scale: 2
      t.timestamps
    end
  end
end

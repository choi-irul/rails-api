class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :store, foreign_key: true
      t.string :name
      t.string :description
      t.decimal :price, precision: 12, scale: 2
      t.integer :weight
      t.timestamps
    end
  end
end

class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.string :number
      t.decimal :total_price, precision: 12, scale: 2
      t.integer :status
      t.timestamps
    end
  end
end

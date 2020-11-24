class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.references :variant, foreign_key: true
      t.integer    :status
      t.datetime   :checkout_at
      t.datetime   :deleted_at
      t.timestamps
    end
  end
end

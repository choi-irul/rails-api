class CreateProductsVariants < ActiveRecord::Migration[6.0]
  def change
    create_table :products_variants, id: false do |t|
      t.references :product, foreign_key: true
      t.references :variant, foreign_key: true
    end
  end
end

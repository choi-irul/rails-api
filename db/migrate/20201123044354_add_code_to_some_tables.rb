class AddCodeToSomeTables < ActiveRecord::Migration[6.0]
  def change
    add_column :stores, :code, :string
    add_column :products, :code, :string
    add_column :variants, :code, :string
  end
end

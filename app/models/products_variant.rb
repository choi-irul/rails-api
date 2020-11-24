# == Schema Information
#
# Table name: products_variants
#
#  product_id :bigint
#  variant_id :bigint
#
class ProductsVariant < ApplicationRecord

  belongs_to :product
  belongs_to :variant
end

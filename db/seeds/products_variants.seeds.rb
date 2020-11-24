# frozen_string_literal: true

# load 'db/seeds/products_variants.seeds.rb'
products_variants = [
  {
    product_id: 1,
    variant_id: 1
  },
  {
    product_id: 1,
    variant_id: 2
  },
  {
    product_id: 2,
    variant_id: 3
  },
  {
    product_id: 2,
    variant_id: 4
  },
  {
    product_id: 3,
    variant_id: 3
  },
  {
    product_id: 3,
    variant_id: 2
  },
  {
    product_id: 4,
    variant_id: 4
  },
  {
    product_id: 4,
    variant_id: 1
  },
  {
    product_id: 4,
    variant_id: 2
  },
  {
    product_id: 2,
    variant_id: 1
  }
]

products_variants.each do |pv|
  product = Product.find pv[:product_id]
  variant = Variant.find pv[:variant_id]

  product.variants << variant

  puts "Seed: #{product.name} - #{variant.name}"
end

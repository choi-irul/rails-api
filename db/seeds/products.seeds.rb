# frozen_string_literal: true

# load 'db/seeds/products.seeds.rb'
products = [
  {
    store_id: 1,
    name: 'Mouse Wired',
    description: 'alat tulis',
    price: 50000,
    weight: 200
  },
  {
    store_id: 2,
    name: 'Keyboard Wired',
    description: 'Buku',
    price: 450000,
    weight: 800
  },
  {
    store_id: 5,
    name: 'Mouse Bluetooth',
    description: 'Peralatan Komputer',
    price: 125000,
    weight: 500
  },
  {
    store_id: 3,
    name: 'Keyboard Bluetooth',
    description: 'Buku',
    price: 450000,
    weight: 800
  },
]

products.each do |product|
  store = Store.find(product[:store_id])
  code = "#{store.code}-#{product[:name].downcase.gsub(' ', '-')}"

  p = Product.find_or_initialize_by(code: code, store_id: product[:store_id])

  p.name        = product[:name]
  p.description = product[:description]
  p.price       = product[:price]
  p.weight      = product[:weight]
  p.save

  puts "Seed: #{p.code} - #{p.name}"
end

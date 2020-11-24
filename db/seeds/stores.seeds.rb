# frozen_string_literal: true

# load 'db/seeds/stores.seeds.rb'
stores = [
  {
    code: 'store-toko-maju',
    name: 'Toko Maju',
    address: '',
    phone: '0812345735'
  },
  {
    code: 'store-toko-jaya',
    name: 'Toko Jaya',
    address: '',
    phone: '0812345736'
  },
  {
    code: 'store-toko-sukses',
    name: 'Toko Sukses',
    address: '',
    phone: '0812345737'
  },
  {
    code: 'store-toko-sejahtera',
    name: 'Toko Sejahtera',
    address: '',
    phone: '0812345738'
  },
  {
    code: 'store-toko-makmur',
    name: 'Toko Makmur',
    address: '',
    phone: '0812345739'
  },
  {
    code: 'store-toko-klasik',
    name: 'Toko Klasik',
    address: '',
    phone: '08123457340'
  }
]

stores.each do |store|
  s = Store.find_or_initialize_by(code: store[:code])

  s.name    = store[:name]
  s.address = store[:address]
  s.phone   = store[:phone]
  s.save

  puts "Seed: #{s.code} - #{s.name}"
end

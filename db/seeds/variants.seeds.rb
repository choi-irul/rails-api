# frozen_string_literal: true

# load 'db/seeds/variants.seeds.rb'
variants = [
  {
    code: 'warna-merah',
    name: 'Merah',
    description: 'Berwarna Merah'
  },
  {
    code: 'warna-biru',
    name: 'Biru',
    description: 'Berwarna Biru'
  },
  {
    code: 'warna-hitam',
    name: 'Hitam',
    description: 'Berwarna Hitam'
  },
  {
    code: 'warna-abu-abu',
    name: 'Abu-abu',
    description: 'Berwarna Abu-abu'
  },
  {
    code: 'warna-biru-hitam',
    name: 'Biru Hitam',
    description: 'Berwarna Biru Hitam'
  },
  {
    code: 'warna-putih',
    name: 'Putih',
    description: 'Berwarna Putih'
  }
]

variants.each do |variant|
  v = Variant.find_or_initialize_by(code: variant[:code])

  v.name        = variant[:name]
  v.description = variant[:description]
  v.save

  puts "Seed: #{v.code} - #{v.name}"
end

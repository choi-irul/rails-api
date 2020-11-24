# == Schema Information
#
# Table name: stores
#
#  id         :bigint           not null, primary key
#  name       :string
#  address    :string
#  phone      :string
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  code       :string
#
class Store < ApplicationRecord
  has_many :products
end

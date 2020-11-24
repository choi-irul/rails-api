# == Schema Information
#
# Table name: variants
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  code        :string
#
class Variant < ApplicationRecord
  has_and_belongs_to_many :products
end

# == Schema Information
#
# Table name: carts
#
#  id          :bigint           not null, primary key
#  user_id     :bigint
#  product_id  :bigint
#  variant_id  :bigint
#  status      :integer
#  checkout_at :datetime
#  deleted_at  :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  quantity    :integer
#
class Cart < ApplicationRecord
  acts_as_paranoid

  belongs_to :user
  belongs_to :product
  belongs_to :variant

  enum status: %i[created ordered]
end

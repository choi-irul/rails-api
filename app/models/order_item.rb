# == Schema Information
#
# Table name: order_items
#
#  id         :bigint           not null, primary key
#  order_id   :bigint
#  cart_id    :bigint
#  product_id :bigint
#  variant_id :bigint
#  title      :string
#  quantity   :integer
#  price      :decimal(12, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :cart
  belongs_to :product
  belongs_to :variant
end

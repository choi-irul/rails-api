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
require 'test_helper'

class CartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

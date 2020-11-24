# == Schema Information
#
# Table name: orders
#
#  id          :bigint           not null, primary key
#  user_id     :bigint
#  number      :string
#  total_price :decimal(12, 2)
#  status      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

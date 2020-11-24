# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  store_id    :bigint
#  name        :string
#  description :string
#  price       :decimal(12, 2)
#  weight      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  code        :string
#
require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

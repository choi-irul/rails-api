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
require 'test_helper'

class StoreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

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
class Order < ApplicationRecord
  has_many :order_items

  belongs_to :user

  enum status: %i[submitted paid completed]

  def self.generate_number
    initial = 'PO'
    number = format(initial + '%s%s', Date.today.strftime('%y%m%d'), SecureRandom.hex.slice(0, 4).upcase)
    number.upcase!
    find_by(number: number) ? generate_number : number
  end
end

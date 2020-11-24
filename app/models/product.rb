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
class Product < ApplicationRecord

  has_and_belongs_to_many :variants
  belongs_to :store

  scope :by_name, lambda { |name|
    return where(nil) if name.blank?

    where('products.name ILIKE :name', name: "%#{name}%")
  }

  scope :by_store_id, lambda { |store_id|
    return where(nil) if store_id.blank?

    where('store_id = ?', store_id)
  }

  def self.search(params)
    params = {} if params.blank?

    by_store_id(params[:store_id])
      .by_name(params[:name])
  end
end

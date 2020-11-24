# frozen_string_literal: true

module Api
  class ProductsController < ApiController
    # before_action :authorize_request

    def index
      @products = Product.eager_load(:store, :variants).search(params)
    end

    def self.generate_number(is_pro = false)
      initial = is_pro ? 'PA' : 'SO'
      number = format(initial + '%s%s', Date.today.strftime('%y%m%d'), SecureRandom.hex.slice(0, 4).upcase)
      number.upcase!
      find_by(number: number) ? generate_number : number
    end
  end
end

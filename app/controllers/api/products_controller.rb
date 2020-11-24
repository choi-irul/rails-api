# frozen_string_literal: true

module Api
  class ProductsController < ApiController
    before_action :authorize_request

    def index
      @products = Product.eager_load(:store, :variants).search(params)
    end
  end
end

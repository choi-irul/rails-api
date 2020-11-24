# frozen_string_literal: true

module Api
  class CartsController < ApiController
    before_action :authorize_request

    def index
      @carts = Cart.eager_load(product: [:store])
                   .where('carts.user_id': current_user.id)
                   .where('carts.status': Cart.statuses[:created])
                   .group_by { |c| c.product.store }
    end

    def create
      cart = Cart.find_or_intialize_by(user_id: params[:user_id], product_id: params[:product_id], variant_id: params[:variant_id], status: Cart.statuses[:created])

      cart.quantity = params[:quantity]
      if cart.save
        render json: :created, status: :created
      else
        render json: { errors: cart.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def update
      cart = Cart.find params[:id]
      cart.quantity = params[:quantity]
      if cart.save
        render json: :updated, status: :ok
      else
        render json: { errors: cart.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end
end

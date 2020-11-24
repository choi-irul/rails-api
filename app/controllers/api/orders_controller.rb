# frozen_string_literal: true

module Api
  class OrdersController < ApiController
    before_action :authorize_request

    def create
      officer = OrderOfficer.new(params[:cart_ids], current_user)
      if officer.perform
        render json: :created, status: :created
      else
        render json: { errors: :failed }, status: :unprocessable_entity
      end
    end

    def order_list
      @orders = Order.includes(:order_items).where(user: current_user)
    end
  end
end

# frozen_string_literal: true

class OrderOfficer
  attr_reader :user

  def initialize(cart_ids, user)
    @cart_ids = cart_ids
    @user     = user
  end

  def perform
    ActiveRecord::Base.transaction do
      total_price = 0
      carts.each do |cart|
        item = create_order_item(cart)

        cart.status      = :ordered
        cart.checkout_at = Time.now
        cart.save

        total_price += item.quantity * item.price
      end

      order.total_price = total_price
      order.save
    end
  end

  private

  def create_order_item(cart)
    item = OrderItem.new
    item.order    = order
    item.cart     = cart
    item.product  = cart.product
    item.variant  = cart.variant
    item.title    = generate_title(cart)
    item.quantity = cart.quantity
    item.price    = cart.product.price
    item.save

    item
  end

  def carts
    @carts ||= Cart.where id: @cart_ids
  end

  def order
    @order ||= begin
      order = Order.new
      order.user   = user
      order.number = Order.generate_number
      order.status = :submitted
      order.save

      order
    end
  end

  def generate_title(cart)
    "#{cart.product.name} [#{cart.variant.name}]"
  end
end

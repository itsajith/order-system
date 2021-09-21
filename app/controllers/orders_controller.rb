# frozen_string_literal: true

class OrdersController < ApplicationController
  def create
    orders = Order.create!(order_params)
    render json: orders
  end

  private

  def order_params
    params.require(:order).permit(line_items_attributes: %i[quantity amount])
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'LineItem', type: :model do
  it 'orders must have many line items' do
    expect(Order.reflect_on_association(:line_items).macro).to eq(:has_many)
  end

  context 'validation test' do
    it 'validate  presence' do
      line_item = LineItem.new
      line_item.save
      expect(line_item).to_not be_valid

      line_item.errors.should have_key(:amount)
      line_item.errors.should have_key(:quantity)
      line_item.errors.should have_key(:subtotal)
      line_item.errors.should have_key(:tax)
      line_item.errors.should have_key(:total)
    end
  end

  context 'validation test' do
    it '' do
      order = Order.new(subtotal: 110, tax: 10, total: 110)
      order.save
      line_item = order.line_items.new(quantity: 1, amount: 100, tax: 10, subtotal: 110, total: 110)
      line_item.save
      expect(line_item).to be_valid
    end
  end
end

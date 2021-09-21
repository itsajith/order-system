# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Order', type: :model do
  it 'orders must have many line items' do
    expect(Order.reflect_on_association(:line_items).macro).to eq(:has_many)
  end
end

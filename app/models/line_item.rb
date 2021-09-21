# frozen_string_literal: true

class LineItem < ApplicationRecord
  belongs_to :order

  validates :quantity, presence: true
  validates :amount, presence: true

  before_save :set_data

  private

  def set_data
    self.subtotal = quantity * amount.to_f
    self.tax = subtotal * 0.008
    self.total = subtotal + (subtotal * 0.008)
  end
end

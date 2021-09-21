# frozen_string_literal: true

class LineItem < ApplicationRecord
  belongs_to :order

  validates :quantity, presence: true
  validates :amount, presence: true

  before_save :set_data

  private

  def set_data
    taxpercentage = 0.008
    self.subtotal = quantity * amount
    self.tax = subtotal * taxpercentage
    self.total = subtotal + (subtotal * taxpercentage)
  end
end

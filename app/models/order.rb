# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :line_items
  accepts_nested_attributes_for :line_items

  after_save :recalculate


  def recalculate
    self.subtotal = line_items.sum(&:subtotal)
    self.tax = line_items.sum(&:tax)
    self.total = line_items.sum(&:total)
  end
end

# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.decimal :subtotal, default: 0
      t.decimal :tax, default: 0
      t.decimal :total, default: 0

      t.timestamps
    end
  end
end

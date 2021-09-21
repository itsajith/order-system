# frozen_string_literal: true

class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|
      t.references :order, foreign_key: true
      t.integer :quantity, null: false
      t.decimal :amount, null: false
      t.decimal :subtotal, null: false
      t.decimal :tax, null: false
      t.decimal :total, null: false

      t.timestamps
    end
  end
end

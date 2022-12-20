# frozen_string_literal: true

class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses, id: :uuid do |t|
      t.decimal :valor, precision: 20, scale: 2
      t.date :data
      t.references :company, null: false, foreign_key: true, type: :uuid
      t.references :construction, null: false, foreign_key: true, type: :uuid
      t.references :account, null: false, foreign_key: true, type: :uuid
      t.references :category, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end

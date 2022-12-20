# frozen_string_literal: true

class CreateConstructions < ActiveRecord::Migration[7.0]
  def change
    create_table :constructions, id: :uuid do |t|
      t.string :description
      t.date :dt_start
      t.date :dt_end
      t.integer :percetage
      t.decimal :valor, precision: 20, scale: 2
      t.boolean :final, default: false
      t.references :company, null: false, foreign_key: true, type: :uuid
      t.references :category, null: false, foreign_key: true, type: :uuid
      t.references :engineer, null: false, foreign_key: true, type: :uuid
      t.timestamps
    end
  end
end

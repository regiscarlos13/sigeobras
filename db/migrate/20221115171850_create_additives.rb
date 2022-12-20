# frozen_string_literal: true

class CreateAdditives < ActiveRecord::Migration[7.0]
  def change
    create_table :additives, id: :uuid do |t|
      t.date :data
      t.decimal :valor, precision: 20, scale: 2
      t.references :company, null: false, foreign_key: true, type: :uuid
      t.references :construction, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end

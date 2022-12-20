# frozen_string_literal: true

class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories, id: :uuid do |t|
      t.string :description
      t.references :company, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end

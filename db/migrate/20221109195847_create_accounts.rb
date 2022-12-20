# frozen_string_literal: true

class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts, id: :uuid do |t|
      t.string :description
      t.integer :tipe
      t.integer :cost
      t.references :company, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end

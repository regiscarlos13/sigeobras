# frozen_string_literal: true

class CreateEngineers < ActiveRecord::Migration[7.0]
  def change
    create_table :engineers, id: :uuid do |t|
      t.string :cpf
      t.string :name
      t.references :company, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end

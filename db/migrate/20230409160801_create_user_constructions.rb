# frozen_string_literal: true

class CreateUserConstructions < ActiveRecord::Migration[7.0]
  def change
    create_table :user_constructions, id: :uuid do |t|
      t.references :construction, null: false, foreign_key: true, type: :uuid
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end

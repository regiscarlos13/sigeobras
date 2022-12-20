# frozen_string_literal: true

class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies, id: :uuid do |t|
      t.string :cnpj
      t.string :name
      t.boolean :block

      t.timestamps
    end
  end
end

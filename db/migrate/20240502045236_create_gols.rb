# frozen_string_literal: true

class CreateGols < ActiveRecord::Migration[7.1]
  def change
    create_table :gols do |t|
      t.references :particip, null: false, foreign_key: true
      t.boolean :eh_contra, null: false, default: false
      t.boolean :eh_gol_de_ouro, null: false, default: false

      t.timestamps
    end
  end
end

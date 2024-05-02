# frozen_string_literal: true

class CreatePartidas < ActiveRecord::Migration[7.1]
  def change
    create_table :partidas do |t|
      t.integer :ordem
      t.references :fase, null: false, foreign_key: true

      t.timestamps
    end

    add_index :partidas, %i[fase_id ordem], unique: true
  end
end

# frozen_string_literal: true

class CreateArbitragems < ActiveRecord::Migration[7.1]
  def change
    create_table :arbitragems do |t|
      t.string :type
      t.references :partida, null: false, foreign_key: true
      t.references :pessoa, null: false, foreign_key: true

      t.timestamps
    end

    add_index :arbitragems, %i[partida_id pessoa_id], unique: true
  end
end

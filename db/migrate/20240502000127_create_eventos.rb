# frozen_string_literal: true

class CreateEventos < ActiveRecord::Migration[7.1]
  def change
    create_table :eventos do |t|
      t.references :liga, null: false, foreign_key: true
      t.string :nome, null: false
      t.date :data_inicio
      t.date :data_final

      t.timestamps
    end

    add_index :eventos, :nome, unique: true
  end
end

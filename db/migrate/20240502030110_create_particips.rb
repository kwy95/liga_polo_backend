# frozen_string_literal: true

class CreateParticips < ActiveRecord::Migration[7.1]
  def change
    create_table :particips do |t|
      t.boolean :eh_coringa, null: false, default: false
      t.references :pessoa, null: false, foreign_key: true
      t.references :equipe, null: false, foreign_key: true
      t.references :partida, null: false, foreign_key: true

      t.timestamps
    end

    add_index :particips, %i[pessoa_id equipe_id partida_id], unique: true
  end
end

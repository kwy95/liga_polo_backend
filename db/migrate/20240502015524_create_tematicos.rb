# frozen_string_literal: true

class CreateTematicos < ActiveRecord::Migration[7.1]
  def change
    create_table :tematicos do |t|
      t.references :evento, null: false, foreign_key: true, index: false
      t.references :equipe, null: false, foreign_key: true
      t.string :type

      t.timestamps
    end

    add_index :tematicos, :evento_id, unique: true
    add_index :tematicos, %i[evento_id equipe_id], unique: true
  end
end

# frozen_string_literal: true

class CreateEquipes < ActiveRecord::Migration[7.1]
  def change
    create_table :equipes do |t|
      t.string :nome, null: false

      t.timestamps
    end

    add_index :equipes, :nome
  end
end

# frozen_string_literal: true

class CreateClubes < ActiveRecord::Migration[7.1]
  def change
    create_table :clubes do |t|
      t.string :nome, null: false
      t.string :localidade, null: false

      t.timestamps
    end

    add_index :clubes, :nome
    add_index :clubes, %i[nome localidade], unique: true
  end
end

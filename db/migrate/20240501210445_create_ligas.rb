# frozen_string_literal: true

class CreateLigas < ActiveRecord::Migration[7.1]
  def change
    create_table :ligas do |t|
      t.string :nome, null: false

      t.timestamps
    end

    add_index :ligas, :nome, unique: true
  end
end

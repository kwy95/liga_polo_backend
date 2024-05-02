# frozen_string_literal: true

class CreateFases < ActiveRecord::Migration[7.1]
  def change
    create_table :fases do |t|
      t.references :evento, null: false, foreign_key: true
      t.string :type

      t.timestamps
    end
  end
end

# frozen_string_literal: true

class CreateFaltas < ActiveRecord::Migration[7.1]
  def change
    create_table :faltas do |t|
      t.references :particip, null: false, foreign_key: true
      t.string :consequencia, null: false, default: 'comum'
      t.string :type

      t.timestamps
    end
  end
end

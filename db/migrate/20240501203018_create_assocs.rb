# frozen_string_literal: true

class CreateAssocs < ActiveRecord::Migration[7.1]
  def change
    create_table :assocs do |t|
      t.references :pessoa, null: false, foreign_key: true
      t.references :clube, null: false, foreign_key: true
      t.date :data_inicio, null: false
      t.date :data_fim

      t.timestamps
    end
  end
end

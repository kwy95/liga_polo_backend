# frozen_string_literal: true

class CreatePessoas < ActiveRecord::Migration[7.1]
  def change
    create_table :pessoas do |t|
      t.string :nome, null: false
      t.date :data_nascimento
      t.boolean :eh_mtnb, null: false, default: true

      t.timestamps
    end

    add_index :pessoas, :nome
  end
end

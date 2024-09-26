# frozen_string_literal: true

class AddEhCasaToParticips < ActiveRecord::Migration[7.2]
  def change
    add_column :particips, :eh_casa, :boolean, null: false, default: true
  end
end

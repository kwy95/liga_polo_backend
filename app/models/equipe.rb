# frozen_string_literal: true

# == Schema Information
#
# Table name: equipes
#
#  id         :bigint           not null, primary key
#  nome       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_equipes_on_nome  (nome)
#
class Equipe < ApplicationRecord
  validates :nome, presence: true
end

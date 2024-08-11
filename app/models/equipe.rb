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
  has_many :tematicos, dependent: :destroy
  has_many :particips, dependent: :destroy
  has_many :pessoas, through: :particips
  has_many :partidas, through: :particips
  has_many :faltas, through: :particips
  has_many :gols, through: :particips

  validates :nome, presence: true
end

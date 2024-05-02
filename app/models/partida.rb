# frozen_string_literal: true

# == Schema Information
#
# Table name: partidas
#
#  id         :bigint           not null, primary key
#  ordem      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  fase_id    :bigint           not null
#
# Indexes
#
#  index_partidas_on_fase_id            (fase_id)
#  index_partidas_on_fase_id_and_ordem  (fase_id,ordem) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (fase_id => fases.id)
#
class Partida < ApplicationRecord
  belongs_to :fase

  has_many :arbitragems, dependent: :destroy
  has_many :particips, dependent: :destroy
  has_many :equipes, through: :particips
  has_many :jogadores, through: :particips, source: :pessoa
  has_many :faltas, through: :particips

  validates :ordem, uniqueness: { scope: :fase_id }
end

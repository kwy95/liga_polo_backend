# frozen_string_literal: true

# == Schema Information
#
# Table name: pessoas
#
#  id              :bigint           not null, primary key
#  data_nascimento :date
#  eh_mtnb         :boolean          default(TRUE), not null
#  nome            :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_pessoas_on_nome  (nome)
#
class Pessoa < ApplicationRecord
  attribute :eh_mtnb, default: true

  has_many :assocs, dependent: :destroy
  has_many :clubes, through: :assocs
  has_many :arbitragems, dependent: :destroy
  has_many :particips, dependent: :destroy
  has_many :equipes, through: :particips
  has_many :partidas, through: :particips
  has_many :faltas, through: :particips

  validates :nome, presence: true
  validates :eh_mtnb, exclusion: [nil]
end

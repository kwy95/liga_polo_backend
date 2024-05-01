# frozen_string_literal: true

# == Schema Information
#
# Table name: clubes
#
#  id         :bigint           not null, primary key
#  localidade :string           not null
#  nome       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_clubes_on_nome                 (nome)
#  index_clubes_on_nome_and_localidade  (nome,localidade) UNIQUE
#
class Clube < ApplicationRecord
  has_many :assocs, dependent: :destroy
  has_many :pessoas, through: :assocs

  validates :nome, presence: true, uniqueness: { scope: :localidade }
  validates :localidade, presence: true
end

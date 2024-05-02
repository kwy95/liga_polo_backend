# frozen_string_literal: true

# == Schema Information
#
# Table name: eventos
#
#  id          :bigint           not null, primary key
#  data_final  :date
#  data_inicio :date
#  nome        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  liga_id     :bigint           not null
#
# Indexes
#
#  index_eventos_on_liga_id  (liga_id)
#  index_eventos_on_nome     (nome) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (liga_id => ligas.id)
#
class Evento < ApplicationRecord
  belongs_to :liga

  has_many :fases, dependent: :destroy

  validates :nome, presence: true
end

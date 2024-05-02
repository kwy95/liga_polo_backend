# frozen_string_literal: true

# == Schema Information
#
# Table name: arbitragems
#
#  id         :bigint           not null, primary key
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  partida_id :bigint           not null
#  pessoa_id  :bigint           not null
#
# Indexes
#
#  index_arbitragems_on_partida_id                (partida_id)
#  index_arbitragems_on_partida_id_and_pessoa_id  (partida_id,pessoa_id) UNIQUE
#  index_arbitragems_on_pessoa_id                 (pessoa_id)
#
# Foreign Keys
#
#  fk_rails_...  (partida_id => partidas.id)
#  fk_rails_...  (pessoa_id => pessoas.id)
#
FactoryBot.define do
  factory :arbitragem do
    partida
    pessoa
    type { nil }
  end
end

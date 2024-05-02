# frozen_string_literal: true

# == Schema Information
#
# Table name: particips
#
#  id         :bigint           not null, primary key
#  eh_coringa :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  equipe_id  :bigint           not null
#  partida_id :bigint           not null
#  pessoa_id  :bigint           not null
#
# Indexes
#
#  index_particips_on_equipe_id                               (equipe_id)
#  index_particips_on_partida_id                              (partida_id)
#  index_particips_on_pessoa_id                               (pessoa_id)
#  index_particips_on_pessoa_id_and_equipe_id_and_partida_id  (pessoa_id,equipe_id,partida_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (equipe_id => equipes.id)
#  fk_rails_...  (partida_id => partidas.id)
#  fk_rails_...  (pessoa_id => pessoas.id)
#
FactoryBot.define do
  factory :particip do
    eh_coringa { false }
    pessoa
    equipe
    partida

    trait :coringa do
      eh_coringa { true }
    end
  end
end

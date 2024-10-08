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
FactoryBot.define do
  factory :partida do
    sequence(:ordem)
    fase
  end
end

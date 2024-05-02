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
FactoryBot.define do
  factory :evento do
    liga
    sequence(:nome) { |n| "Evento #{n}" }
    data_inicio { '2024-05-01' }
    data_final { '2024-05-01' }
  end
end

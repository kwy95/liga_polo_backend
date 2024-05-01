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
FactoryBot.define do
  factory :clube do
    sequence(:nome) { |n| "Clube #{n}" }
    localidade { 'Cidade - UF' }
  end
end

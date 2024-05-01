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
FactoryBot.define do
  factory :pessoa do
    sequence(:nome) { |n| "Pessoa #{n}" }
    data_nascimento { '2024-05-01' }
    eh_mtnb { false }

    trait :mtnb do
      eh_mtnb { true }
    end
  end
end

# frozen_string_literal: true

# == Schema Information
#
# Table name: ligas
#
#  id         :bigint           not null, primary key
#  nome       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_ligas_on_nome  (nome) UNIQUE
#
FactoryBot.define do
  factory :liga do
    sequence(:nome) { |n| "Liga #{n}" }
  end
end

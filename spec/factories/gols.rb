# frozen_string_literal: true

# == Schema Information
#
# Table name: gols
#
#  id             :bigint           not null, primary key
#  eh_contra      :boolean          default(FALSE), not null
#  eh_gol_de_ouro :boolean          default(FALSE), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  particip_id    :bigint           not null
#
# Indexes
#
#  index_gols_on_particip_id  (particip_id)
#
# Foreign Keys
#
#  fk_rails_...  (particip_id => particips.id)
#
FactoryBot.define do
  factory :gol do
    particip
    eh_contra { false }
    eh_gol_de_ouro { false }

    trait :contra do
      eh_contra { true }
    end

    trait :de_ouro do
      eh_gol_de_ouro { true }
    end
  end
end

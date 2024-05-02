# frozen_string_literal: true

# == Schema Information
#
# Table name: faltas
#
#  id           :bigint           not null, primary key
#  consequencia :string           default("comum"), not null
#  type         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  particip_id  :bigint           not null
#
# Indexes
#
#  index_faltas_on_particip_id  (particip_id)
#
# Foreign Keys
#
#  fk_rails_...  (particip_id => particips.id)
#
FactoryBot.define do
  factory :falta do
    particip
    consequencia { 'comum' }
    type { nil }
  end
end

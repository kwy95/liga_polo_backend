# frozen_string_literal: true

# == Schema Information
#
# Table name: fases
#
#  id         :bigint           not null, primary key
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  evento_id  :bigint           not null
#
# Indexes
#
#  index_fases_on_evento_id  (evento_id)
#
# Foreign Keys
#
#  fk_rails_...  (evento_id => eventos.id)
#
FactoryBot.define do
  factory :fase do
    evento
    type { nil }
  end
end

# frozen_string_literal: true

# == Schema Information
#
# Table name: tematicos
#
#  id         :bigint           not null, primary key
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  equipe_id  :bigint           not null
#  evento_id  :bigint           not null
#
# Indexes
#
#  index_tematicos_on_equipe_id                (equipe_id)
#  index_tematicos_on_evento_id                (evento_id) UNIQUE
#  index_tematicos_on_evento_id_and_equipe_id  (evento_id,equipe_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (equipe_id => equipes.id)
#  fk_rails_...  (evento_id => eventos.id)
#
FactoryBot.define do
  factory :tematico do
    evento
    equipe
    type { nil }
  end
end

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
class Gol < ApplicationRecord
  attribute :eh_contra, default: false
  attribute :eh_gol_de_ouro, default: false

  belongs_to :particip

  validates :eh_contra, exclusion: [nil]
  validates :eh_gol_de_ouro, exclusion: [nil]
end

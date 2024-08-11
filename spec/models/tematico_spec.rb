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
require 'rails_helper'

RSpec.describe Tematico do
  let(:tematico) { build(:tematico) }

  it 'esperado que seja válido' do
    expect(tematico).to be_valid
  end

  describe 'Associações' do
    it { is_expected.to belong_to(:evento) }
    it { is_expected.to belong_to(:equipe) }
  end

  describe 'Validações' do
    it { expect(tematico).to validate_uniqueness_of(:evento_id) }
    it { expect(tematico).to validate_uniqueness_of(:equipe_id).scoped_to(:evento_id) }
  end
end

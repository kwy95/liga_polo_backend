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
require 'rails_helper'

RSpec.describe Fase do
  let(:fase) { build(:fase) }

  it 'esperado que seja válido' do
    expect(fase).to be_valid
  end

  describe 'Associações' do
    it { is_expected.to belong_to(:evento) }
    it { is_expected.to have_many(:partidas).dependent(:destroy) }
  end
end

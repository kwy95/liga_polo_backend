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
require 'rails_helper'

RSpec.describe Gol do
  let(:gol) { build(:gol) }

  it 'esperado que seja válido' do
    expect(gol).to be_valid
  end

  describe 'Associações' do
    it { is_expected.to belong_to(:particip) }
  end

  describe 'Validações' do
    it { is_expected.to validate_exclusion_of(:eh_contra).in_array([nil]) }
    it { is_expected.to validate_exclusion_of(:eh_gol_de_ouro).in_array([nil]) }

    it 'esperado que eh_contra tenha o valor padrão' do
      expect(described_class.new.eh_contra).to be false
    end

    it 'esperado que eh_gol_de_ouro tenha o valor padrão' do
      expect(described_class.new.eh_gol_de_ouro).to be false
    end
  end
end

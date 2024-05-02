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
require 'rails_helper'

RSpec.describe Falta do
  let(:falta) { build(:falta) }

  it 'esperado que seja válido' do
    expect(falta).to be_valid
  end

  describe 'Associações' do
    it { is_expected.to belong_to(:particip) }
  end

  describe 'Validações' do
    it { is_expected.to validate_presence_of(:consequencia) }

    it 'esperado que consequencia tenha o valor padrão' do
      expect(described_class.new.consequencia).to eq 'comum'
    end
  end
end

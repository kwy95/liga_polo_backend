# frozen_string_literal: true

# == Schema Information
#
# Table name: partidas
#
#  id         :bigint           not null, primary key
#  ordem      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  fase_id    :bigint           not null
#
# Indexes
#
#  index_partidas_on_fase_id            (fase_id)
#  index_partidas_on_fase_id_and_ordem  (fase_id,ordem) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (fase_id => fases.id)
#
require 'rails_helper'

RSpec.describe Partida do
  let(:partida) { build(:partida) }

  it 'esperado que seja válido' do
    expect(partida).to be_valid
  end

  describe 'Associações' do
    it { is_expected.to belong_to(:fase) }
    it { is_expected.to have_many(:arbitragems).dependent(:destroy) }
    it { is_expected.to have_many(:particips).dependent(:destroy) }
    it { is_expected.to have_many(:equipes).through(:particips) }
    it { is_expected.to have_many(:jogadores).through(:particips).source(:pessoa) }
  end

  describe 'Validações' do
    it { expect(partida).to validate_uniqueness_of(:ordem).scoped_to(:fase_id) }
  end
end

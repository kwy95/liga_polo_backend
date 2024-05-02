# frozen_string_literal: true

# == Schema Information
#
# Table name: equipes
#
#  id         :bigint           not null, primary key
#  nome       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_equipes_on_nome  (nome)
#
require 'rails_helper'

RSpec.describe Equipe do
  let(:equipe) { build(:equipe) }

  it 'esperado que seja válido' do
    expect(equipe).to be_valid
  end

  describe 'Associações' do
    it { is_expected.to have_many(:tematicos).dependent(:destroy) }
    it { is_expected.to have_many(:particips).dependent(:destroy) }
    it { is_expected.to have_many(:pessoas).through(:particips) }
    it { is_expected.to have_many(:partidas).through(:particips) }
  end

  describe 'Validações' do
    it { is_expected.to validate_presence_of(:nome) }
  end
end

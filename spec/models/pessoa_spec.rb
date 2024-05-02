# frozen_string_literal: true

# == Schema Information
#
# Table name: pessoas
#
#  id              :bigint           not null, primary key
#  data_nascimento :date
#  eh_mtnb         :boolean          default(TRUE), not null
#  nome            :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_pessoas_on_nome  (nome)
#
require 'rails_helper'

RSpec.describe Pessoa do
  let(:pessoa) { build(:pessoa) }

  it 'esperado que seja válido' do
    expect(pessoa).to be_valid
  end

  describe 'Associações' do
    it { is_expected.to have_many(:assocs).dependent(:destroy) }
    it { is_expected.to have_many(:clubes).through(:assocs) }
    it { is_expected.to have_many(:arbitragems).dependent(:destroy) }
    it { is_expected.to have_many(:particips).dependent(:destroy) }
    it { is_expected.to have_many(:equipes).through(:particips) }
    it { is_expected.to have_many(:partidas).through(:particips) }
  end

  describe 'Validações' do
    it { is_expected.to validate_presence_of(:nome) }
    it { is_expected.to validate_exclusion_of(:eh_mtnb).in_array([nil]) }

    it 'esperado que eh_mtnb tenha o valor padrão' do
      expect(described_class.new.eh_mtnb).to be true
    end
  end
end

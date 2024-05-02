# frozen_string_literal: true

# == Schema Information
#
# Table name: ligas
#
#  id         :bigint           not null, primary key
#  nome       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_ligas_on_nome  (nome) UNIQUE
#
require 'rails_helper'

RSpec.describe Liga do
  let(:liga) { build(:liga) }

  it 'esperado que seja válido' do
    expect(liga).to be_valid
  end

  describe 'Associações' do
    it { is_expected.to have_many(:eventos).dependent(:destroy) }
  end

  describe 'Validações' do
    it { is_expected.to validate_presence_of(:nome) }
    it { expect(liga).to validate_uniqueness_of(:nome) }
  end
end

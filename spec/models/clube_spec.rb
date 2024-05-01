# frozen_string_literal: true

# == Schema Information
#
# Table name: clubes
#
#  id         :bigint           not null, primary key
#  localidade :string           not null
#  nome       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_clubes_on_nome                 (nome)
#  index_clubes_on_nome_and_localidade  (nome,localidade) UNIQUE
#
require 'rails_helper'

RSpec.describe Clube do
  let(:clube) { build(:clube) }

  it 'esperado que seja válido' do
    expect(clube).to be_valid
  end

  describe 'Validações' do
    it { is_expected.to validate_presence_of(:nome) }
    it { expect(clube).to validate_uniqueness_of(:nome).scoped_to(:localidade) }
    it { is_expected.to validate_presence_of(:localidade) }
  end
end

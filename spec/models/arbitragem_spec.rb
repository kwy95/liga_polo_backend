# frozen_string_literal: true

# == Schema Information
#
# Table name: arbitragems
#
#  id         :bigint           not null, primary key
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  partida_id :bigint           not null
#  pessoa_id  :bigint           not null
#
# Indexes
#
#  index_arbitragems_on_partida_id                (partida_id)
#  index_arbitragems_on_partida_id_and_pessoa_id  (partida_id,pessoa_id) UNIQUE
#  index_arbitragems_on_pessoa_id                 (pessoa_id)
#
# Foreign Keys
#
#  fk_rails_...  (partida_id => partidas.id)
#  fk_rails_...  (pessoa_id => pessoas.id)
#
require 'rails_helper'

RSpec.describe Arbitragem do
  let(:arbitragem) { build(:arbitragem) }

  it 'esperado que seja válido' do
    expect(arbitragem).to be_valid
  end

  describe 'Associações' do
    it { is_expected.to belong_to(:partida) }
    it { is_expected.to belong_to(:pessoa) }
  end

  describe 'Validações' do
    it { expect(arbitragem).to validate_uniqueness_of(:pessoa_id).scoped_to(:partida_id) }
  end
end

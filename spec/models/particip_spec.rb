# frozen_string_literal: true

# == Schema Information
#
# Table name: particips
#
#  id         :bigint           not null, primary key
#  eh_coringa :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  equipe_id  :bigint           not null
#  partida_id :bigint           not null
#  pessoa_id  :bigint           not null
#
# Indexes
#
#  index_particips_on_equipe_id                               (equipe_id)
#  index_particips_on_partida_id                              (partida_id)
#  index_particips_on_pessoa_id                               (pessoa_id)
#  index_particips_on_pessoa_id_and_equipe_id_and_partida_id  (pessoa_id,equipe_id,partida_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (equipe_id => equipes.id)
#  fk_rails_...  (partida_id => partidas.id)
#  fk_rails_...  (pessoa_id => pessoas.id)
#
require 'rails_helper'

RSpec.describe Particip do
  let(:particip) { build(:particip) }

  it 'esperado que seja válido' do
    expect(particip).to be_valid
  end

  describe 'Associações' do
    it { is_expected.to belong_to(:pessoa) }
    it { is_expected.to belong_to(:equipe) }
    it { is_expected.to belong_to(:partida) }
    it { is_expected.to have_many(:faltas).dependent(:destroy) }
  end

  describe 'Validações' do
    it { is_expected.to validate_exclusion_of(:eh_coringa).in_array([nil]) }
    it { expect(particip).to validate_uniqueness_of(:pessoa_id).scoped_to(%i[equipe_id partida_id]) }

    it 'esperado que eh_coringa tenha o valor padrão' do
      expect(described_class.new.eh_coringa).to be false
    end
  end
end

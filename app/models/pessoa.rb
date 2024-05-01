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
class Pessoa < ApplicationRecord
  attribute :eh_mtnb, default: true

  validates :nome, presence: true
  validates :eh_mtnb, exclusion: [nil]
end

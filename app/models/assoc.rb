# frozen_string_literal: true

# == Schema Information
#
# Table name: assocs
#
#  id          :bigint           not null, primary key
#  data_fim    :date
#  data_inicio :date             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  clube_id    :bigint           not null
#  pessoa_id   :bigint           not null
#
# Indexes
#
#  index_assocs_on_clube_id   (clube_id)
#  index_assocs_on_pessoa_id  (pessoa_id)
#
# Foreign Keys
#
#  fk_rails_...  (clube_id => clubes.id)
#  fk_rails_...  (pessoa_id => pessoas.id)
#
class Assoc < ApplicationRecord
  belongs_to :pessoa
  belongs_to :clube

  validates :data_inicio, presence: true
end

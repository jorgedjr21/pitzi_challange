# frozen_string_literal: true

require 'cpf_cnpj'

class User < ApplicationRecord
  validates :cpf, presence: true, allow_blank: false, uniqueness: true
  validate :cpf_validation

  def cpf_validation
    errors.add(:cpf, 'invalid cpf') unless CPF.valid?(cpf)
  end
end

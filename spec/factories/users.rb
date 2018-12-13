# frozen_string_literal: true

require 'cpf_cnpj'

FactoryBot.define do
  factory :user do
    name  { FFaker::NameBR.name }
    cpf   { CPF.generate(true) }
    email { FFaker::Internet.email }
  end
end

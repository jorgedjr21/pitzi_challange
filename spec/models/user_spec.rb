# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { create(:user) }

  describe 'Given an user' do
    context 'with same CPF as other user' do
      let!(:user_2) { build(:user, cpf: user.cpf) }

      it 'must not save the user' do
        expect{ user_2.save }.not_to change(User, :count)
      end
    end

    context 'with invalid CPF' do
      let!(:user_3) { build(:user, cpf: '111.111-222-11') }
      it 'must not save the user' do
        expect{ user_3.save }.not_to change(User, :count)
      end
    end
  end
end

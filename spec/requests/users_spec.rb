# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let!(:users) { create_list(:user, 5) }

  describe 'GET /api/v1/users' do
    it 'must get all users' do
      get api_v1_users_path, params: {}
      expect(response.body).to eq(users.to_json)
    end
  end

  describe 'GET /api/v1/users/:id' do
    context 'when the user exists' do
      before { get api_v1_user_path(id: users.first.id) }

      it 'must return a user information' do
        expect(response.body).to eq(users.first.to_json)
      end

      it 'must have http status 200' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the user doesn\' exists' do
      before { get api_v1_user_path(id: 999) }
      it 'must have http status 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'POST /api/v1/users' do
    context 'when the request is valid' do
      before { post api_v1_users_path, params: { name: FFaker::Name.name, cpf: CPF.generate(true) } }

      it 'must create a new user' do
        expect(response.body).to eq(User.last.to_json)
      end

      it 'must have http status 201' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'when the request is invalid' do
      before { post api_v1_users_path, params: { name: FFaker::Name.name, cpf: '' } }

      it 'must have http status 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PUT /api/v1/users/:id' do
    context 'when the user exists' do
      before { put api_v1_user_path(id: users.first.id), params: { name: 'Updated Name' } }

      it 'must update the user' do
        expect(User.first.name).to eq('Updated Name')
      end

      it 'must return empty response' do
        expect(response.body).to be_empty
      end

      it 'must have http status 204' do
        expect(response).to have_http_status(:no_content)
      end
    end
  end

  describe 'DELETE /api/v1/users/:id' do
    context 'when the user exists' do
      before { delete api_v1_user_path(id: users.first.id) }

      it 'must return empty response' do
        expect(response.body).to be_empty
      end

      it 'must have http status 204' do
        expect(response).to have_http_status(:no_content)
      end
    end
  end
end

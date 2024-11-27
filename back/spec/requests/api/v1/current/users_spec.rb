require 'rails_helper'

RSpec.describe "Api::V1::Current::Users", type: :request do
  let(:logged_in_user) { FactoryBot.create(:user) }

  describe 'GET /current/user' do
    it 'ログイン中のユーザー情報を返す' do
      get '/api/v1/current/user', headers: sign_in(logged_in_user)

      expect(response).to have_http_status(:ok)
    end
  end
end
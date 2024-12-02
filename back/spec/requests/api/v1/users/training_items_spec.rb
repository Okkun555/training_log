require 'rails_helper'

RSpec.describe 'Api::V1::Users::TrainingItems', type: :request do
  let(:test_user) { FactoryBot.create(:user) }
  let!(:training_items) { FactoryBot.create_list(:training_item, 3, created_user: test_user) }

  describe 'GET /users/{user_id}/training_items' do
    context 'ログイン中のユーザーに対してリクエストする時' do
      it '200ステータスと紐づく種目一覧を返却する' do
        get "/api/v1/users/#{test_user.id}/training_items", headers: sign_in(test_user)

        expect(response).to have_http_status(:ok)

        json_response = JSON.parse(response.body)
        expect(json_response.size).to eq(3)
        expect(json_response[0]).to include(
          'id' => training_items[0].id,
          'name' => training_items[0].name,
          'weight_unit' => training_items[0].weight_unit
        )
      end
    end

    context 'ログイン中のユーザー以外のリソースに対してリクエストする時' do
      it '403ステータスとエラーメッセージを返却する' do
        # MEMO:本人以外のIDを設定するため、id - 1を実施
        get "/api/v1/users/#{test_user.id - 1}/training_items", headers: sign_in(test_user)

        expect(response).to have_http_status(:forbidden)
      end
    end
  end
end

require "rails_helper"

describe SessionsController do
  context "POST create" do
    let!(:carlos_handle) { 'CarlosC' }
    let!(:carlos) { create(:user, handle: 'CarlosC') }
    let(:bad_handle) { 'cArLoSc' }

    it "can authenticate" do
      post :create, params: { session: { handle: carlos_handle } }, format: :json
      json_response = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(json_response['handle']).to eq(carlos_handle)
    end

    it "handles bad authentication" do
      create(:user, handle: carlos_handle)

      post :create, params: { session: { handle: bad_handle } }, format: :json
      expect(response).to have_http_status(:not_found)
    end
  end
end
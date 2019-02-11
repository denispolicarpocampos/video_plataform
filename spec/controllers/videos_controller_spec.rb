require 'rails_helper'

RSpec.describe VideosController, type: :controller do
  describe "GET #show" do
    context 'right params' do
      let(:user) { create(:user) }
      let(:video) { create(:video, user: user) }
      it "returns http success" do
        get :show, params: { id: video.id }
        expect(response).to have_http_status(:success)
      end
    end

    context 'wrong params' do
      it "returns http not found" do
        get :show, params: { id: -1 }
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end

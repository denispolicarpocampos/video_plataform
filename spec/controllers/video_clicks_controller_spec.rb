require 'rails_helper'

RSpec.describe VideoClicksController, type: :controller do
  describe "GET #show" do

    let!(:user) { create(:user) }
    let!(:video) { create(:video, user: user) }
    let!(:video_click) { VideoClick.create(video_id: video.id) }

    context 'right params' do
      it "returns http success" do
        get :show, params: { id: video.id }
        expect(response).to have_http_status(:success)
      end

      it "return counter equal 1" do
        get :show, params: { id: video.id }
        expect(JSON.parse(response.body)['counter']).to eql(1)
      end
    end
  end

  describe "POST #create" do
    context 'right params' do
      let(:user) { create(:user) }
      let(:video) { create(:video, user: user) }
      it "returns http success" do
        post :create, params: { video_click: { video_id: video.id } }
        expect(response).to have_http_status(:success)
      end

      it "change db by 1 row" do
        expect do
          post :create, params: { video_click: { video_id: video.id } }
        end.to change { VideoClick.count }.by(1)
      end
    end

    context 'wrong params' do
      it "returns http not found" do
        get :create, params: { video_click: { video_id: -1 } }
        expect(response).to have_http_status(422)
      end
    end
  end
end

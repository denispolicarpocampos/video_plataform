require 'rails_helper'

RSpec.describe Admin::VideosController, type: :controller do

  describe "GET #index" do
    context 'user login' do
      login_user
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    context 'admin login' do
      login_admin
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "GET /admin/videos/:id" do
    context 'normal user' do
      login_user
      context 'video exists and user was creator' do
        let(:video) { create(:video, user: @user) }
        it "returns http success" do
          get :show, params: { id: video.id }
          expect(response).to have_http_status(:success)
        end
      end

      context 'video does not exist' do
        it "returns http not found" do
          get :show, params: { id: -1 }
          expect(response).to have_http_status(:not_found)
        end
      end

      context 'show video of other user' do
        let(:user_1) { create(:user)}
        let(:video) { create(:video, user: user_1) }
        it "returns http forbbiden" do
          get :show, params: { id: video.id }
          expect(response).to have_http_status(:forbidden)
        end
      end
    end

    context 'admin user' do
      login_admin
      context 'show video of other user' do
        let(:user_1) { create(:user)}
        let(:video) { create(:video, user: user_1) }
        it "returns http forbbiden" do
          get :show, params: { id: video.id }
          expect(response).to have_http_status(:success)
        end
      end
    end
  end

  describe "GET #destroy" do
    context 'normal users' do
      login_user
      context 'destroy own video' do
        let(:video) { create(:video, user: @user) }
        it "returns http success" do
          get :destroy, params: { id: video.id}
          expect(response).to have_http_status(302)
        end
      end

      context 'destroy video of other user' do
        let(:user_1) { create(:user)}
        let(:video) { create(:video, user: user_1) }
        it "returns http forbidden" do
          get :destroy, params: { id: video.id}
          expect(response).to have_http_status(:forbidden)
        end
      end
    end

    context 'admin user' do
      context 'destroy video of other user' do
        let(:user_1) { create(:user)}
        let(:video) { create(:video, user: user_1) }
        it "returns http forbidden" do
          get :destroy, params: { id: video.id}
          expect(response).to have_http_status(302)
        end
      end
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update" do
    it "returns http success" do
      get :update
      expect(response).to have_http_status(:success)
    end
  end

end

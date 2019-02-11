require 'rails_helper'

RSpec.describe SearchUsersController, type: :controller do
  describe "GET #index" do
    context 'right params' do
      let!(:user) { create(:user) }
      it "returns http success" do
        get :index, params: { email: user.email }
        expect(response).to redirect_to(playlist_path(user.id))
      end

      it 'redirect to playlist' do
        user_2 = FactoryBot.create(:user, email: "#{user.email.split('@')[0]}@xxx.com")
        get :index, params: { email: user_2.email.split('@')[0] }
        expect(response).to have_http_status(200) 
      end
    end
  end
end

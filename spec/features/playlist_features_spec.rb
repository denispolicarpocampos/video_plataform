require 'capybara/rspec'

describe "playlist", type: :feature do
  before(:each) do
    @user = FactoryBot.create(:user)
    login_as(@user, :scope => :user)
  end

  context 'playlist has videos' do
    before(:each) do
      @video = FactoryBot.create(:video, user: @user)
      visit "/playlists/#{@user.id}"
    end

    scenario "has links of videos" do
      expect(page).to have_link "#{@video.name}"
    end

    scenario "has list of videos" do
      expect(page).to have_css ".card"
    end
  end

  context 'playlist has not videos' do
    before(:each) do
      visit "/playlists/#{@user.id}"
    end

    scenario "has message not found" do
      expect(page).to have_content "Usuário não possui vídeos em sua playlist"
    end
  end
end
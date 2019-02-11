require 'capybara/rspec'

describe "videos", type: :feature do
  before(:each) do
    @user = FactoryBot.create(:user)
    @video = FactoryBot.create(:video, user: @user)
    visit "/videos/#{@video.id}"
  end
  scenario "has player" do
    expect(page).to have_css "video-js#my_video_1"
  end

  scenario "has name of video" do
    expect(page).to have_content "#{@video.name}"
  end

  scenario "has email of user" do
    expect(page).to have_content "Publicado por: #{@user.email}"
  end
end
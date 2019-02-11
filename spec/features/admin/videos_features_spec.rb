require 'capybara/rspec'

describe "video#index", type: :feature do
  before(:each) do
    @user = FactoryBot.create(:user)
    login_as(@user, :scope => :user)
    @video = FactoryBot.create(:video, user: @user)
    visit "/admin/videos"
  end

  scenario "has table when load the page" do
    expect(page).to have_css "table"
  end

  scenario "click add link" do
    click_link('Adicionar vídeo')
    expect(page).to have_content "Adicionar Vídeo"

  end

  scenario "click edit link" do
    click_link('Editar')
    expect(page).to have_content "Editar Vídeo"
  end

  scenario "click show link" do
    click_link('Ver')
    expect(page).to have_content "Video - #{@video.name}"
  end
end


describe "video#create", type: :feature do
  before(:each) do
    @user = FactoryBot.create(:user)
    login_as(@user, :scope => :user)
    visit "/admin/videos/new"
  end

  scenario "has itens when load the page" do
    expect(page).to have_content "Name"
    expect(page).to have_content "Url"
    expect(page).to have_css "#video_name"
    expect(page).to have_css "#video_url"
  end

  scenario "click on save with correct params" do
    within("#new_video") do
      fill_in 'Name', with: 'teste'
      fill_in 'Url', with: 'https://content.jwplatform.com/manifests/yp34SRmf.m3u8'
    end
    click_button('Salvar')
    expect(page).to have_content "Adicionar vídeo"
  end

  scenario "click on save with name invalid" do
    within("#new_video") do
      fill_in 'Name', with: ''
      fill_in 'Url', with: 'https://content.jwplatform.com/manifests/yp34SRmf.m3u8'
    end
    click_button('Salvar')
    expect(page).to have_content "Name can't be blank"
  end

  scenario "click on save with url invalid" do
    within("#new_video") do
      fill_in 'Name', with: 'teste'
      fill_in 'Url', with: 'https://content.jwplatform.com/manifests/yp34SRmf'
    end
    click_button('Salvar')
    expect(page).to have_content "Url deve conter a extensão .m3u8"
  end
end


describe "video#update", type: :feature do
  before(:each) do
    @user = FactoryBot.create(:user)
    login_as(@user, :scope => :user)
    @video = FactoryBot.create(:video, user: @user)
    visit "/admin/videos/#{@video.id}/edit"
  end

  scenario "click on save with correct params" do
    within(".edit_video") do
      fill_in 'Name', with: 'teste'
      fill_in 'Url', with: 'https://content.jwplatform.com/manifests/yp34SRmf.m3u8'
    end
    click_button('Salvar')
    expect(page).to have_content "Adicionar vídeo"
  end

  scenario "click on save with name invalid" do
    within(".edit_video") do
      fill_in 'Name', with: ''
      fill_in 'Url', with: 'https://content.jwplatform.com/manifests/yp34SRmf.m3u8'
    end
    click_button('Salvar')
    expect(page).to have_content "Name can't be blank"
  end

  scenario "click on save with url invalid" do
    within(".edit_video") do
      fill_in 'Name', with: 'teste'
      fill_in 'Url', with: 'https://content.jwplatform.com/manifests/yp34SRmf'
    end
    click_button('Salvar')
    expect(page).to have_content "Url deve conter a extensão .m3u8"
  end
end

describe "video#show", type: :feature do
  before(:each) do
    @user = FactoryBot.create(:user)
    login_as(@user, :scope => :user)
    @video = FactoryBot.create(:video, user: @user)
    visit "/admin/videos/#{@video.id}"
  end

  scenario "has itens when load the page" do
    expect(page).to have_content @video.name
    expect(page).to have_content @video.url
  end
end
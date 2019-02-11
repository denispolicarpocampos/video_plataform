require 'capybara/rspec'

describe "homepage", type: :feature do
  scenario "has title call" do
    visit '/'
    expect(page).to have_content 'Busque por um usuário'
  end
end

describe "navbar", type: :feature do
  context 'Not logged' do
    scenario 'redirect to login' do
      visit '/'
      click_link 'Entrar'
      expect(page).to have_content 'Log in'
    end

    scenario 'redirect to sign up' do
      visit '/'
      click_link 'Criar Conta'
      expect(page).to have_content 'Sign up'
    end
  end

  context 'Logged' do
    before(:each) do
      @user = FactoryBot.create(:user)
      login_as(@user, :scope => :user)
    end

    scenario 'redirect to restrict area' do
      visit '/'
      click_link 'Área restrita'
      expect(page).to have_content 'Adicionar vídeo'
    end

    scenario 'show playlist' do
      visit '/'
      click_link 'Sua playlist'
      expect(page).to have_content "Playlist - #{@user.email}"
    end

    scenario 'log out' do
      visit '/'
      click_link 'Sair'
      expect(page).to have_content 'Busque por um usuário'
    end
  end
end
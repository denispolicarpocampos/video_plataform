require 'capybara/rspec'

describe "login", type: :feature do
  before(:each) do
    @user = FactoryBot.create(:user)
  end

  scenario "login ok" do
    visit '/users/sign_in'
    within(".new_user") do
      fill_in 'Email', with: "#{@user.email}"
      fill_in 'Password', with: "secret123"
    end
    click_button 'Log in'
    expect(page).to have_content 'Sua playlist'
  end
end

describe "signup", type: :feature do
  context 'Not logged' do
    scenario 'allow rescrict area' do
      visit '/users/sign_up'
      within("#new_user") do
        fill_in 'Email', with: "teste@gmail.com"
        fill_in 'Password', with: "secret123"
        fill_in 'Password confirmation', with: "secret123"
      end
      click_button'Sign up'
      expect(page).to have_content 'Área restrita'
    end

    scenario 'same email' do
      @user = FactoryBot.create(:user)
      visit '/users/sign_up'
      within("#new_user") do
        fill_in 'Email', with: "#{@user.email}"
        fill_in 'Password', with: "secret123"
        fill_in 'Password confirmation', with: "secret123"
      end
      click_button 'Sign up'
      expect(page).to have_content 'Sign up'
    end
  end
end
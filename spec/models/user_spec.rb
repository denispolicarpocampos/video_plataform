require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Create User' do
    let(:user) { create(:user) }
    it 'create user with normal privileges' do
      expect(user.has_role? :normal).to be true
    end
  end
end

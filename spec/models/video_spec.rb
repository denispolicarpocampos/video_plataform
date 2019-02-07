require 'rails_helper'

RSpec.describe Video, type: :model do
  it 'is not valid without a name' do
    should validate_presence_of(:name)
  end

  it 'is not valid without a url' do
    should validate_presence_of(:url)
  end

  it 'is not valid with url extension is diferent of m3u8' do
    should allow_value('http://www.testem.br').for(:url)
  end
end

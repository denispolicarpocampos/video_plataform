require 'rails_helper'

RSpec.describe Video, type: :model do
  it 'is not valid without a name' do
    should validate_presence_of(:name)
  end

  it 'is not valid without a url' do
    should validate_presence_of(:url)
  end

  it 'valid with url extension is diferent of m3u8' do
    should allow_value("#{FFaker::InternetSE.http_url}/file.m3u8").for(:url)
  end
end

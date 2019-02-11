require 'rails_helper'

RSpec.describe VideoClick, type: :model do
  it 'is not valid without a video_id' do
    should validate_presence_of(:video_id)
  end
end

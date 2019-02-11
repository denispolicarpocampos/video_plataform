class Video < ApplicationRecord
  validates :name, :url, presence: true
  validates :url, url: true
  validates :url, format: { with: /\.m3u8\Z/, message: 'deve conter a extensão .m3u8' }

  belongs_to :user
  has_many :video_clicks
end

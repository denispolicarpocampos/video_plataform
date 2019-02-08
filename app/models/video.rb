class Video < ApplicationRecord
  validates :name, presence: true
  validates :url, presence: true, url: true, format: { with: /\.m3u8\Z/ }

  belongs_to :user
end

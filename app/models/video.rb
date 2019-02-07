class Video < ApplicationRecord
  validates :name, :url, presence: true
  belongs_to :user
end

class User < ApplicationRecord
  rolify
  after_create :assign_default_role

  has_many :videos
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  def assign_default_role
    self.add_role(:normal)
  end
end

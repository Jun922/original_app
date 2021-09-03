class Room2 < ApplicationRecord
  has_many :room2_users
  has_many :users, through: :room2_users
  has_many :chats, dependent: :destroy

  validates :name, presence: true
end

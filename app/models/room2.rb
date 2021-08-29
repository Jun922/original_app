class Room2 < ApplicationRecord
  belongs_to :user
  has_many :chats

  validates :name, presence: true
end

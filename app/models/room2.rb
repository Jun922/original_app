class Room2 < ApplicationRecord
  belongs_to :user, optional: true
  has_many :chats, dependent: :destroy

  validates :name, presence: true
end

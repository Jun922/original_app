class Room2 < ApplicationRecord
  belongs_to :user, optional: true
  has_many :messages

  validates :name, presence: true
end

class Room < ApplicationRecord
  belongs :user
  has_many :messages
  
  validates :name, presence: true
end

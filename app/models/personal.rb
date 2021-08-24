class Personal < ApplicationRecord
  belongs_to :user
  has_many :chats
end

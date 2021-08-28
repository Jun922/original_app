class Personal < ApplicationRecord
  belongs_to :users
  has_many :chats
end

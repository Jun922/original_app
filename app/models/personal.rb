class Personal < ApplicationRecord
  has_many :users, through: :personal_users
  has_many :personal_users
  has_many :chats
end

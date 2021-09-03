class Chat < ApplicationRecord
  belongs_to :room2
  belongs_to :user

  validates :content, presence: true
end

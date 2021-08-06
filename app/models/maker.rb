class Maker < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one_attached :image

  validates :content, presence: true
end

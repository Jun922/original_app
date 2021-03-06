class Post < ApplicationRecord
  belongs_to :room2
  belongs_to :user, optional: true
  has_one_attached :image

  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end

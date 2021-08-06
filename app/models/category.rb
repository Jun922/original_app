class category < ApplicationRecord
  belongs_to :user
  has_many :makers
end

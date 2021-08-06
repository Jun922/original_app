class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :categories
  has_many :makers

  with_options presence: true do
    validates :password, length: { minimum: 6 }, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "is invalid. Input half-width characters."}
    validates :nickname
    validates :birthday
  end
end

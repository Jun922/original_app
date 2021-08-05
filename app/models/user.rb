class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :introduction, length: { maximum: 100 }
    validates :birthday
    #validates :prefecture_id  numericality: {other_than: 1}
  end
end

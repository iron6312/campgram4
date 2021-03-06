class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :gears
  has_many :post, dependent: :destroy
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, :password_confirmation, confirmation: true
  with_options presence: true do
    validates :nickname
    validates :age
    validates :camp_history
    validates :favorite_camp_type
  end
end
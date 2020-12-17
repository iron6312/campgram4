class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :description
    validates :recomended
    validates :image
  end
end

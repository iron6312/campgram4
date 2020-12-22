class Gear < ApplicationRecord
  validates :content, presence: true  # 空のデータをはじくバリデーション
  belongs_to :user
  has_many :tags, dependent: :destroy  # アソシエーション ＋ postレコードを削除したときに紐づいたtagを同時に削除
  accepts_nested_attributes_for :tags, allow_destroy: true  # fields_for（後述）に必要
end

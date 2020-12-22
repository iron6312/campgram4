class Tag < ApplicationRecord
  validates :content, presence: true  # 空のデータをはじくバリデーション

  belongs_to :gear  # アソシエーション
end

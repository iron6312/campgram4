require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '新規投稿' do
    it "キャンプ場が空だと登録できない" do
      @post.title = ""
      @post.valid?
      expect(@post.errors.full_messages).to include("User must exist", "Title can't be blank", "Image can't be blank")
    end
    it "説明が空では登録できない" do
      @post.description = ""
      @post.valid?
      expect(@post.errors.full_messages).to include("User must exist", "Description can't be blank", "Image can't be blank")
    end
    it 'オススメが記入されてないと登録できない' do
      @post.recomended = ""
      @post.valid?
      expect(@post.errors.full_messages).to include("User must exist", "Recomended can't be blank", "Image can't be blank")
    end
    it '商品画像を１枚つけないと出品できない' do
      @post.image = nil
      @post.valid?
      expect(@post.errors[:image]).to include("can't be blank")
    end
  end
end

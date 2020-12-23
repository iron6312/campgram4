require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailに＠ついてないと登録できない' do
      @user.email = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'emailが６文字以上ではないと登録できない' do
      @user.email = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it '他のuserのemailとかぶると登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken', 'Email has already been taken')
    end
    it 'passwordは半角英字で入力しないと登録できない' do
      @user.password = 'ａbｃ'
      @user.valid?
      expect(@user.errors[:password]).to include('is too short (minimum is 6 characters)', 'is invalid')
    end
    it 'passwordは半角数字で入力しないと登録できない' do
      @user.password = '１２３'
      @user.valid?
      expect(@user.errors[:password]).to include('is too short (minimum is 6 characters)', 'is invalid')
    end
    it 'passwordは半角英字のみだと登録できない' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors[:password]).to include('is invalid')
    end
    it 'passwordは半角数字のみだと登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors[:password]).to include('is invalid')
    end
    it 'passwordがpassword(確認用)の値が一致しないと登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordが空だと登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank", "Password confirmation doesn't match Password")
    end
    it "camp_historyが空では登録できない" do
      @user.camp_history = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Camp history can't be blank")
    end
    it "ageが空だと登録できない" do
      @user.age = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Age can't be blank")
    end
    it "favorite_camp_typeが空では登録できない" do
      @user.favorite_camp_type = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Favorite camp type can't be blank")
    end
  end
end
require 'rails_helper'

describe "User" do
  describe '#create' do

    # 有効なユーザー
    it 'is valid' do
      user = build(:user)
      user.valid?
      expect(user).to be_valid
    end

    # 無効なユーザー presence true系
    it 'is invalid email cannot be blank' do
      user = build(:user, email:"")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'is invalid nickname cannot be blank' do
      user = build(:user, nickname:"")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it 'is invalid lastname cannot be blank' do
      user = build(:user, lastname:"")
      user.valid?
      expect(user.errors[:lastname]).to include("can't be blank")
    end

    it 'is invalid firstname cannot be blank' do
      user = build(:user, firstname:"")
      user.valid?
      expect(user.errors[:firstname]).to include("can't be blank")
    end

    it 'is invalid lastname_kana cannot be blank' do
      user = build(:user, lastname_kana:"")
      user.valid?
      expect(user.errors[:lastname_kana]).to include("can't be blank")
    end

    it 'is invalid firstname_kana cannot be blank' do
      user = build(:user, firstname_kana:"")
      user.valid?
      expect(user.errors[:firstname_kana]).to include("can't be blank")
    end

    it 'is invalid telephone_number cannot be blank' do
      user = build(:user, telephone_number:"")
      user.valid?
      expect(user.errors[:telephone_number]).to include("can't be blank")
    end

    it 'is invalid birthdate cannot be blank' do
      user = build(:user, birthdate:"")
      user.valid?
      expect(user.errors[:birthdate]).to include("can't be blank")
    end

    it 'is invalid password cannot be blank' do
      user = build(:user, password:"")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid password_confirmation does not match" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    # 無効なユーザー 一意性系
    it "is invalid email not unique" do
      email = Faker::Internet.email
      user = create(:user, email: email)
      user2 = build(:user, email: email)
      user2.valid?
      expect(user2.errors[:email]).to include("has already been taken")
    end

    

    # 無効なユーザー 長さ系
    it "is valid more than 7letters" do
      password = Faker::Internet.password(min_length: 7, max_length: 7)
      user = build(:user, password: password, password_confirmation: password)
      expect(user).to be_valid
    end

    it "is invalid less than 6letters" do
      password = Faker::Internet.password(min_length: 6, max_length: 6)
      user = build(:user, password: password, password_confirmation: password)
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
    end

    # 正規表現系 有効パターン 無効パターン
    it 'is valid email should be' do
      user = build(:user, email:"testmail@yahoo.co.jp")
      expect(user[:email]).to match( /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
    end

    it 'is invalid email should not be' do
      user = build(:user, email:"yhooogoole@@")
      user.valid?
      expect(user.errors[:email]).to include("is invalid")
    end

    it 'is valid lastname should be zenkaku' do
      user = build(:user, lastname:"大山")
      expect(user[:lastname]).to match( /\A[^ -~｡-ﾟ]+\z/)
    end

    it 'is invalid lastname should be zenkaku' do
      user = build(:user, lastname:"aaa")
      user.valid?
      expect(user.errors[:lastname]).to include("is invalid")
    end
    

  end
end
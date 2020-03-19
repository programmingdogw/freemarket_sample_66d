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


  end
end
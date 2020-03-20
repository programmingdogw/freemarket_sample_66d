require 'rails_helper'

describe "Address" do
  describe '#create' do

    # 有効な住所
    it 'is valid' do
      address = build(:address)
      address.valid?
      expect(address).to be_valid
    end

    # 無効なユーザー presence true系
    it 'is invalid lastname cannot be blank' do
      address = build(:address, lastname:"")
      address.valid?
      expect(address.errors[:lastname]).to include("can't be blank")
    end

    it 'is invalid firstname cannot be blank' do
      address = build(:address, firstname:"")
      address.valid?
      expect(address.errors[:firstname]).to include("can't be blank")
    end

    it 'is invalid lastname_kana cannot be blank' do
      address = build(:address, lastname_kana:"")
      address.valid?
      expect(address.errors[:lastname_kana]).to include("can't be blank")
    end

    it 'is invalid firstname_kana cannot be blank' do
      address = build(:address, firstname_kana:"")
      address.valid?
      expect(address.errors[:firstname_kana]).to include("can't be blank")
    end

    it 'is invalid postal_code cannot be blank' do
      address = build(:address, postal_code:"")
      address.valid?
      expect(address.errors[:postal_code]).to include("can't be blank")
    end

    it 'is invalid prefecture cannot be blank' do
      address = build(:address, prefecture:"")
      address.valid?
      expect(address.errors[:prefecture]).to include("can't be blank")
    end

    it 'is invalid municipality cannot be blank' do
      address = build(:address, municipality:"")
      address.valid?
      expect(address.errors[:municipality]).to include("can't be blank")
    end

    it 'is invalid street cannot be blank' do
      address = build(:address, street:"")
      address.valid?
      expect(address.errors[:street]).to include("can't be blank")
    end

    # 正規表現系 有効パターン 無効パターン
    it 'is valid lastname should be zenkaku' do
      address = build(:address, lastname:"大山")
      expect(address[:lastname]).to match( /\A[^ -~｡-ﾟ]+\z/ )
    end

    it 'is invalid lastname should be zenkaku' do
      address = build(:address, lastname:"aaa")
      address.valid?
      expect(address.errors[:lastname]).to include("is invalid")
    end
    
    it 'is valid lastname_kana should be zenkaku kana' do
      address = build(:address, lastname_kana:"おおやま")
      expect(address[:lastname_kana]).to match( /\A[ぁ-んァ-ヶー－]+\z/ )
    end

    it 'is valid lastname_kana should be zenkaku kana' do
      address = build(:address, lastname_kana:"オオヤマ")
      expect(address[:lastname_kana]).to match( /\A[ぁ-んァ-ヶー－]+\z/ )
    end

    it 'is invalid lastname_kana should be zenkaku kana' do
      address = build(:address, lastname_kana:"大山")
      address.valid?
      expect(address.errors[:lastname_kana]).to include("is invalid")
    end

    it 'is valid firstname_kana should be zenkaku kana' do
      address = build(:address, firstname_kana:"さぶろう")
      expect(address[:firstname_kana]).to match( /\A[ぁ-んァ-ヶー－]+\z/ )
    end

    it 'is valid firstname_kana should be zenkaku kana' do
      address = build(:address, firstname_kana:"サブロウ")
      expect(address[:firstname_kana]).to match( /\A[ぁ-んァ-ヶー－]+\z/ )
    end

    it 'is invalid firstname_kana should be zenkaku kana' do
      address = build(:address, firstname_kana:"三郎")
      address.valid?
      expect(address.errors[:firstname_kana]).to include("is invalid")
    end

    it 'is valid postal_code should be' do
      address = build(:address, postal_code:"771-8913")
      expect(address[:postal_code]).to match( /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/ )
    end

    it 'is invalid postal_code should not be' do
      address = build(:address, postal_code:"7718913")
      address.valid?
      expect(address.errors[:postal_code]).to include("is invalid")
    end

  end
end
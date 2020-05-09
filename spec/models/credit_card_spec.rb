require 'rails_helper'

describe CreditCard do
  describe '#pay' do

    # 有効なカード
    it "user_id,customer_id,card_idが存在すれば登録可能" do
      credit_card = build(:credit_card)
      credit_card.valid?
      expect(credit_card).to be_valid
    end
  end
end
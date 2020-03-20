require 'rails_helper'

describe "Address" do
  describe '#create' do

    # 有効な住所
    it 'is valid' do
      address = build(:address)
      address.valid?
      expect(address).to be_valid
    end

  end
end
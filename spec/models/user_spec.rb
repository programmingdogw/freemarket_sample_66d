require 'rails_helper'

describe "User" do
  describe '#create' do
    it "is invalid without a nickname" do
      user = FactoryBot.build(:user, nickname: "nil")
      binding.pry
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end
  end
end
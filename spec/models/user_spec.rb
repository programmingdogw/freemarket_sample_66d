require 'spec_helper'

describe "User" do
  describe '#create' do
    let(:user) { create(:user) }
    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end
  end
end
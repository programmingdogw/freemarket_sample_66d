require 'spec_helper'

describe "User" do
  describe '#create' do
    it "is invalid without a nickname" do
      expect(FactoryBot.build(:user)).to be_invalid  
    end
  end
end
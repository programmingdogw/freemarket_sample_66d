require 'rails_helper'

describe "Item" do
  
  describe '#create' do

    # 有効な商品
    it 'is valid' do
      item = build(:item)
      item.valid?
      expect(item).to be_valid
    end

    # 無効なユーザー presence true系
    it 'is invalid category_id cannot be blank' do
      item = build(:item, category_id:"")
      item.valid?
      expect(item).to be_invalid
    end

    it 'is invalid name cannot be blank' do
      item = build(:item, name:"")
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it 'is invalid price cannot be blank' do
      item = build(:item, price:"")
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it 'is invalid condition_id cannot be blank' do
      item = build(:item, condition_id:"")
      item.valid?
      expect(item.errors[:condition_id]).to include("can't be blank")
    end

    it 'is invalid description cannot be blank' do
      item = build(:item, description:"")
      item.valid?
      expect(item .errors[:description]).to include("can't be blank")
    end 

    it 'is invalid size_id cannot be blank' do
      item = build(:item, size_id:"")
      item.valid?
      expect(item.errors[:size_id]).to include("can't be blank")
    end

    it 'is invalid deliveryway_id cannot be blank' do
      item = build(:item, deliveryway_id:"")
      item.valid?
      expect(item.errors[:deliveryway_id]).to include("can't be blank")
    end

    it 'is invalid deliverycost_id cannot be blank' do
      item = build(:item, deliverycost_id:"")
      item.valid?
      expect(item.errors[:deliverycost_id]).to include("can't be blank")
    end

    it 'is invalid delivery_from cannot be blank' do
      item = build(:item, delivery_from:"")
      item.valid?
      expect(item.errors[:delivery_from]).to include("can't be blank")
    end

    it 'is invalid deliverytime_id cannot be blank' do
      item = build(:item, deliverytime_id:"")
      item.valid?
      expect(item.errors[:deliverytime_id]).to include("can't be blank")
    end
        
    
  end


end
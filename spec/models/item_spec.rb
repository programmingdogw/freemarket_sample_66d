require 'rails_helper'


describe "Item" do
  
  describe '#create' do

    # 有効な商品
    it 'is valid' do
      item = build(:item)
      item.valid?
      expect(item).to be_valid
    end

    # 無効な商品 presence true系
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

    it 'is invalid parentcategory cannot be blank' do
      item = build(:item, parentcategory:"")
      item.valid?
      expect(item.errors[:parentcategory]).to include("can't be blank")
    end

    it 'is invalid childcategory cannot be blank' do
      item = build(:item, childcategory:"")
      item.valid?
      expect(item.errors[:childcategory]).to include("can't be blank")
    end
        

    # 有効、無効な商品 文字の長さ系
    it "is valid name less than or equal 40letters" do
      fakename = Faker::Lorem.characters(number: 39)
      item = build(:item, name: fakename)
      expect(item).to be_valid
    end

    it "is invalid name more than 40letters" do
      fakename = Faker::Lorem.characters(number: 41)
      item = build(:item, name: fakename)
      expect(item).to be_invalid
    end

    it "is valid description less than or equal 1000letters" do
      fakedescription = Faker::Lorem.characters(number: 1000)
      item = build(:item, description: fakedescription)
      expect(item).to be_valid
    end

    it "is invalid description more than 1000letters" do
      fakedescription = Faker::Lorem.characters(number: 1001)
      item = build(:item, description: fakedescription)
      expect(item).to be_invalid
    end

    # 有効、無効な商品 値の大きさ系
    it 'is invalid price cannot be less than 300' do
      item = build(:item, price: 299)
      item.valid?
      expect(item).to be_invalid
    end

    it 'is valid price more than or equal 300' do
      item = build(:item, price: 300)
      item.valid?
      expect(item).to be_valid
    end

    it 'is invalid price cannot be more than 9999999' do
      item = build(:item, price: 10000000)
      item.valid?
      expect(item).to be_invalid
    end

    it 'is valid price less than or equal 9999999' do
      item = build(:item, price: 9999999)
      item.valid?
      expect(item).to be_valid
    end
    
  end

  describe '#update' do

    # 更新系テスト記述予定
    it '名前が更新される' do
      item = build(:item)
      expect(item.name).to eq '商品名'
      item.update(name: "更新済商品名")
      expect(item.name).to eq '更新済商品名' 
    end
    
    it '無効な名前' do
      item = build(:item)
      expect(item.name).to eq '商品名'
      item.update(name: "")
      expect(item).to be_invalid 
    end

  end

end
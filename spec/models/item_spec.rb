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

    it '説明文が更新される' do
      item = build(:item)
      expect(item.description).to eq '商品説明'
      item.update(description: "更新済説明文")
      expect(item.description).to eq '更新済説明文' 
    end
    
    it '無効な説明文' do
      item = build(:item)
      expect(item.description).to eq '商品説明'
      item.update(description: "")
      expect(item).to be_invalid 
    end

    it 'ブランドが更新される' do
      item = build(:item)
      expect(item.brand).to eq 'シャネル'
      item.update(brand: "グッチ")
      expect(item.brand).to eq 'グッチ' 
    end
    
    it 'ブランドは任意なのでここだけ有効' do
      item = build(:item)
      expect(item.brand).to eq 'シャネル'
      item.update(brand: "")
      expect(item).to be_valid 
    end

    it '親カテゴリが更新される' do
      item = build(:item)
      expect(item.parentcategory).to eq 'レディース'
      item.update(parentcategory: "ベビー・キッズ")
      expect(item.parentcategory).to eq 'ベビー・キッズ' 
    end
    
    it 'カテゴリは必須' do
      item = build(:item)
      expect(item.parentcategory).to eq 'レディース'
      item.update(parentcategory: "")
      expect(item).to be_invalid 
    end

    it '子カテゴリが更新される' do
      item = build(:item)
      expect(item.childcategory).to eq 21
      item.update(childcategory: 347)
      expect(item.childcategory).to eq 347 
    end
    
    it 'カテゴリは必須' do
      item = build(:item)
      expect(item.childcategory).to eq 21
      item.update(childcategory: "")
      expect(item).to be_invalid 
    end

    it '孫カテゴリが更新される' do
      item = build(:item)
      expect(item.category_id).to eq 22
      item.update(category_id: 838)
      expect(item.category_id).to eq 838 
    end
    
    it 'カテゴリは必須' do
      item = build(:item)
      expect(item.category_id).to eq 22
      item.update(category_id: "")
      expect(item).to be_invalid 
    end

    it '発送元が更新される' do
      item = build(:item)
      expect(item.delivery_from).to eq "北海道"
      item.update(delivery_from: "青森県")
      expect(item.delivery_from).to eq "青森県" 
    end
    
    it '発送元は必須' do
      item = build(:item)
      expect(item.delivery_from).to eq "北海道"
      item.update(delivery_from: "")
      expect(item).to be_invalid 
    end

    it '商品の状態が更新される' do
      item = build(:item)
      expect(item.condition_id).to eq 1
      item.update(condition_id: 2)
      expect(item.condition_id).to eq 2 
    end
    
    it '商品の状態は必須' do
      item = build(:item)
      expect(item.condition_id).to eq 1
      item.update(condition_id: "")
      expect(item).to be_invalid 
    end

    it '商品のサイズが更新される' do
      item = build(:item)
      expect(item.size_id).to eq 1
      item.update(size_id: 2)
      expect(item.size_id).to eq 2 
    end
    
    it '商品のサイズは必須' do
      item = build(:item)
      expect(item.size_id).to eq 1
      item.update(size_id: "")
      expect(item).to be_invalid 
    end

    it '配送料の負担が更新される' do
      item = build(:item)
      expect(item.deliverycost_id).to eq 1
      item.update(deliverycost_id: 2)
      expect(item.deliverycost_id).to eq 2 
    end
    
    it '配送料の負担は必須' do
      item = build(:item)
      expect(item.deliverycost_id).to eq 1
      item.update(deliverycost_id: "")
      expect(item).to be_invalid 
    end

    it '配送の方法が更新される' do
      item = build(:item)
      expect(item.deliveryway_id).to eq 1
      item.update(deliveryway_id: 2)
      expect(item.deliveryway_id).to eq 2 
    end
    
    it '配送の方法は必須' do
      item = build(:item)
      expect(item.deliveryway_id).to eq 1
      item.update(deliveryway_id: "")
      expect(item).to be_invalid 
    end

    it '配送までの日数が更新される' do
      item = build(:item)
      expect(item.deliverytime_id).to eq 1
      item.update(deliverytime_id: 2)
      expect(item.deliverytime_id).to eq 2 
    end
    
    it '配送までの日数は必須' do
      item = build(:item)
      expect(item.deliverytime_id).to eq 1
      item.update(deliverytime_id: "")
      expect(item).to be_invalid 
    end

  end

end
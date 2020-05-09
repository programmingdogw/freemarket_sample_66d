FactoryBot.define do
  factory :item do
    user_id              {"1"}
    category_id              {"22"}
    name              {"商品名"}
    price              {"1000"}
    condition_id              {"1"}
    description              {"商品説明"}
    size_id              {"1"}
    deliveryway_id              {"1"}
    deliverycost_id              {"1"}
    delivery_from              {"北海道"}
    deliverytime_id              {"1"} 
    brand              {"シャネル"}
    auction              {"true"}
    dealing              {"false"}
    sold              {"false"}
    parentcategory     {"レディース"}
    childcategory              {"21"}
    after(:build) do |item|
      # 親、子、孫を作成して、孫をitemのcategory_idに紐付ける
      parent_category = create(:category)
      child_category = parent_category.children.create(name: "hello")      
      grand_child_category = child_category.children.create(name: "world")
      item.category_id = grand_child_category.id

      item.images << build(:image)
    end
  end
end

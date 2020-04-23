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
  end
end

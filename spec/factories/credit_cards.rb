FactoryBot.define do
  factory :credit_card do
    user_id       {create(:user).id}
    customer_id   { "cus_e5d26fbd4a97253cf0483c66e994" }
    card_id       { "car_dbe3d88f05ea6352f4cd7bcfb650" }
  end
end

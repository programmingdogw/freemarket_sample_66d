require 'rails_helper'

RSpec.describe PurchasesController, type: :controller do

  let(:user) { create(:user) }
  let(:card) { create(:credit_card, user_id: user.id) }
  describe "GET #index" do
    before do
      login user
    end
    it "indexアクションのページに遷移するか" do
      allow(Payjp::Customer).to receive(:create).and_return(PayjpMock.prepare_customer_information)
      item = create(:item, user_id: user.id)
      get :index, params: { item_id: item.id, card: card}
      expect(response).to render_template :index
    end
  end
end
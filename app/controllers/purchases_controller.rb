class PurchasesController < ApplicationController

  require "payjp"
  before_action :set_card, :set_item
  before_action :authenticate_user!

  # 購入確認画面
  def index
    if @card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to new_CreditCard_path
    else
      Payjp.api_key = Rails.application.credentials.payjp[:payjp_private_key]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(@card.customer_id) 
      #カード情報表示のためインスタンス変数に代入
      @card_information = customer.cards.retrieve(@card.card_id)

      @user = User.find(@item.user_id)
      @size = Size.find(@item.size_id)
      @condition = Condition.find(@item.condition_id)
      @deliverycost = Deliverycost.find(@item.deliverycost_id)
      @deliverytime = Deliverytime.find(@item.deliverytime_id)
      @child = Category.find(@item.childcategory)
      @grandchild = Category.find(@item.category_id)
      @images = @item.images
      @firstimage = @item.images.first
      @leftimages = @images[1..-1]
    end
  end

  # 購入
  def pay
    Payjp.api_key = Rails.application.credentials.payjp[:payjp_private_key]
    Payjp::Charge.create(
      :amount => @item.price, #支払金額を引っ張ってくる
      :customer => @card.customer_id,  #顧客ID
      :currency => 'jpy',              #円
    )
    redirect_to done_item_purchases_path #完了画面に移動
  end

  # 支払い完了ページ
  def done
  end

  private
  def set_card
    @card = CreditCard.where(user_id: current_user.id).first if CreditCard.where(user_id: current_user.id).present?
  end

  def item_params
    params.require(:item).permit(:user_id, :address_id, :category_id, :parentcategory, :childcategory, :name, :price, :condition_id, :description, :size_id, :deliverycost_id, :deliveryway_id, :delivery_from, :deliverytime_id, :brand, :auction, :dealing, :sold, images_attributes: [:image])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end

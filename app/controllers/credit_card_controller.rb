class CreditCardController < ApplicationController

  require "payjp"


def index
end

def new
  card = CreditCard.where(user_id: current_user.id)
  redirect_to action: "show" if card.exists?
end

def pay #payjpとCardのデータベース作成を実施。
  Payjp.api_key = Rails.application.credentials.payjp[:payjp_private_key]
  
  if params['payjp-token'].blank?
    redirect_to action: "new"
  else
    customer = Payjp::Customer.create(
    description: '登録テスト', 
    email: current_user.email, 
    card: params['payjp-token'],
    metadata: {user_id: current_user.id}
    ) #念の為metadataにuser_idを入れた
    @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
    if @card.save
      redirect_to action: "show"
    else
      redirect_to action: "pay"
    end
  end
end

def delete #PayjpとCardデータベースを削除
  card = CreditCard.where(user_id: current_user.id).first
  if card.blank?
  else
    Payjp.api_key = Rails.application.credentials.payjp[:payjp_private_key]
    customer = Payjp::Customer.retrieve(card.customer_id)
    customer.delete
    card.delete
  end
    redirect_to action: "index"
end

def show #Cardのデータpayjpに送り情報を取り出す
  card = CreditCard.where(user_id: current_user.id).first
  if card.blank?
     redirect_to action: "index" 
  else
    Payjp.api_key = Rails.application.credentials.payjp[:payjp_private_key]
    customer = Payjp::Customer.retrieve(card.customer_id)
    @default_card_information = customer.cards.retrieve(card.card_id)
  end
end
end
class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def item_params
    params.require(:item).permit(:user_id, :address_id, :brand_id, :category_id, :name, :price, :condition, :description, :size, :delivery_cost, :delivery_from, :delivery_time)
  end

end

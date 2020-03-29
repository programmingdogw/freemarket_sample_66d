class ItemsController < ApplicationController
  
before_action :set_item, except: [:index, :new, :create]


  def index
    @items = Item.includes(:images).order('created_at DESC')
  end

  def new
    @item = Item.new
    @image = @item.images.new
  end

  def create
    @item = Item.new(item_params)
    
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:user_id, :address_id, :brand_id, :category_id, :name, :price, :condition, :description, :size, :delivery_cost, :delivery_way, :delivery_from, :delivery_time, :brand, :auction, :dealing, :sold, images_attributes: [:image])
  end

  def set_item
    @item = Item.find(params[:id])
  end
  

end

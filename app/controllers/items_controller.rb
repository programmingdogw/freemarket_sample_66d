class ItemsController < ApplicationController
  
before_action :set_item, except: [:index, :new, :create, :get_category_children, :get_category_grandchildren]


  def index
    @items = Item.includes(:images).order('created_at DESC')
  end

  def new
    @item = Item.new
    @image = @item.images.new

    #セレクトボックスの初期値設定
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end

    # 親カテゴリーが選択された後に動くアクション
    def get_category_children
      #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
      @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
    end

    # 子カテゴリーが選択された後に動くアクション
    def get_category_grandchildren
      #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
      @category_grandchildren = Category.find("#{params[:child_id]}").children
    end
          
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      redirect_to new_item_path
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
    params.require(:item).permit(:user_id, :address_id, :brand_id, :category_id, :parentcategory, :childcategory, :name, :price, :condition, :description, :size, :delivery_cost, :delivery_way, :delivery_from, :delivery_time, :brand, :auction, :dealing, :sold, images_attributes: [:image])
  end

  def set_item
    @item = Item.find(params[:id])
  end
  

end

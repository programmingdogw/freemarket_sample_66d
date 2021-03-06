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
      redirect_to new_item_path, flash: {itemnotice:'入力されていないか無効な項目があります'}
    end
  end





  def show
    @item = Item.find(params[:id])
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





  def edit
    @item = Item.find(params[:id])
     #セレクトボックスの初期値設定
     @category_parent_array = ["---"]
     #データベースから、親カテゴリーのみ抽出し、配列化
     Category.where(ancestry: nil).each do |parent|
       @category_parent_array << parent.name
     end

    #  実験中の記述
    @editpage_category_children = Category.find_by(name:@item.parentcategory, ancestry:nil).children
    @editpage_category_grandchildren = Category.find_by(id:@item.childcategory).children

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




  def update
    user = User.find(@item.user_id)
    

    if user == current_user
      if @item.update(item_params)
        redirect_to root_path
      else
        redirect_to edit_item_path, flash: {editnotice:'更新失敗です。入力されていないか無効な値があります。'}
      end
    else
      @item.update(purchase_params)
      redirect_to root_path
    end

    

  end





  def destroy
    user = User.find(@item.user_id)
    if user == current_user
      if @item.destroy
        redirect_to root_path
      else
        redirect_to item_path(@item)
      end
    else
      redirect_to  unexpectederrors_path
    end
  end

  

  

  
  private
  def item_params
    params.require(:item).permit(:user_id, :address_id, :category_id, :parentcategory, :childcategory, :name, :price, :condition_id, :description, :size_id, :deliverycost_id, :deliveryway_id, :delivery_from, :deliverytime_id, :brand, :auction, :dealing, :sold, images_attributes: [:image])
  end

  def purchase_params
    params.require(:item).permit(:auction, :dealing, :sold)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end

class ImagesController < ApplicationController

  def destroy
    @item = Item.find(params[:item_id])
    image = Image.find(params[:id])
    image.destroy
    redirect_to edit_item_path(@item)
  end

end

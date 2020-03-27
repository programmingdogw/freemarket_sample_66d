class ExperimentController < ApplicationController
  def index
    @user = current_user
  end

  def sample
    @user = current_user
    @item = Item.new
  end

  def sample2
    @images = Image.all
    @parents = Category.all.where(ancestry: nil)
  end
end

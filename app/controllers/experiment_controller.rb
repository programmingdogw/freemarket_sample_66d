class ExperimentController < ApplicationController
  def index
    @user = current_user
  end

  def sample
    @user = current_user
    @item = Item.new
  end

  def details
  end

end

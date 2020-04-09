class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # respond_to do |format|
    #   format.html 
    #   format.json { render json: @user}
    # end
  end

  def edit
    @user = User.find(params[:id])
  end
end



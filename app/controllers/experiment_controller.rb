class ExperimentController < ApplicationController
  def index
    @user = current_user
  end

  def sample
    @user = current_user
  end
end

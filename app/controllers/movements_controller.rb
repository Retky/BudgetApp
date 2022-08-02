class MovementsController < ApplicationController
  before_action :authenticate_user!

  def index
    @title = 'Movements'
    @user = current_user

    render :index
  end
end

class MovementsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @category = Category.find(params[:category_id])
    @title = "#{@category.name} Movements"
    @movements = @category.movements.order(created_at: :desc)

    render :index
  end
end

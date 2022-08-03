class MovementsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @category = Category.find(params[:category_id])
    @title = "#{@category.name} Movements"
    @movements = @category.movements.order(created_at: :desc)

    render :index
  end

  def new
    @title = 'New Movement'
    @categories = Category.where(user_id: current_user.id)
    @movement = Movement.new
  end

  def create
    @categories = Category.where(user_id: current_user.id)
    @movement = Movement.new(movement_params)
    @movement.user_id = current_user.id
    if @movement.categories.nil?
      flash[:notice] = 'Please select at least one category'
      render :new
    elsif @movement.save
      @movement.categories.each do |category_id|
        CategoryMovement.create(category_id:, movement_id: @movement.id)
      end
      redirect_to categories_path, notice: 'Movement was successfully created.'
    else
      flash[:notice] = 'Please fill in all fields and select at least one category'
      render :new
    end
  end

  private

  def movement_params
    params.require(:movement).permit(:name, :amount, categories: [])
  end
end

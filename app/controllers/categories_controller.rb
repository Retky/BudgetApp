class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @title = 'Categories'
    @user = current_user
    @categories = @user.categories

    render :index
  end

  def new
    @title = 'New Category'
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id

    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end

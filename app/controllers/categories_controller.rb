class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @title = 'Categories'
    @user = current_user
    @categories = @user.categories

    render :index
  end
end

class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @title = 'Categories'
    @user = current_user

    render :index
  end
end

class MovementsController < ApplicationController
  before_action :authenticate_user!

  def index
    render :index
  end
end

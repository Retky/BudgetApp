class SplashController < ApplicationController
  def index
    @title = 'Welcome'

    render :index
  end
end

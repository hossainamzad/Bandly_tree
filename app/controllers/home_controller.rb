class HomeController < ApplicationController
  def index
  	@home = Home.new
  end

  def new
  	@home = Home.new
  end

  def create
  	@home = Home.new(home_params)
  	@home.save

  end

  private
  def home_params
  	params.require(:home).permit(:artist_name)
  end
end

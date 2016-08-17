require 'allmusic'

class SubqueriesController < ApplicationController

	def index
	end

	def show
	end

	def new
		@subquery = Subquery.new
	end

	def create
		@subquery = Subquery.new(subquery_params)
		respond_to do |format|
      if @subquery.save
        @newsubquery = Allmusic.new(@subquery.artist)
        # format.html { redirect_to :back, notice: 'You searched for....' }
        format.json { render :show, status: :created, location: @subquery }
        format.js
      else
        format.html { render :new }
        format.json { render json: @subquery.errors, status: :unprocessable_entity }
      end
    end
	end

  private

  def subquery_params
  	params.require(:subquery).permit(:artist)
  end

end
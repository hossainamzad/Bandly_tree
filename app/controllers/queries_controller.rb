class QueriesController < ApplicationController

  def index
    @query = Query.last
    @queries = Query.all.order('created_at DESC')
      # @queries = Query.all(:order => "created_at DESC")
      # @queries = Query.find(:all, :order => "id desc", :limit => 10).reverse 
  end

  def new
  	@query = Query.new
  end

  def create
  	@query = Query.new(query_params)
    # @query.save
    # redirect_to home_index_path
    respond_to do |format|
      if @query.save
        format.html { redirect_to :back, notice: 'You searched for....' }
        format.json { render :show, status: :created, location: @query }
        format.js
      else
        format.html { render :new }
        format.json { render json: @query.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def query_params
  	params.require(:query).permit(:artist_name)
  end

end

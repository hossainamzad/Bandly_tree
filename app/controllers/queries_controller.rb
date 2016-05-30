class QueriesController < ApplicationController
	


  # @queries = Query.all
  def index
    @query = Query.last
    @queries = Query.all.order('created_at DESC' )
  end

  def new
  	@query = Query.new
  end

  def create
  	@query = Query.new(query_params)
    @query.save
    redirect_to queries_path
  end

  private

  def query_params
  	params.require(:query).permit(:artist_name)
  end

end

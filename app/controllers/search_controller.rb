class SearchController < ApplicationController
  before_action :set_search, only: [:show]

  # GET /search
  # GET /search.json
  def index
    @products = []
    if params[:search]
      if current_user.nil?
        requester_id = request.uuid
      else
        requester_id = current_user.username
      end
      search_terms = {
          format:'json',
          userlocation: "#{get_location[:lat]}, #{get_location[:lng]}" ,
          Keywords: params[:search],
          Page: '1',
          pageSize: '100',
          requestorid:requester_id,
          range: '10',
          rcategory: 'Apparel'


      }
      product_search =  Retailigence::Product.new
      results = product_search.search search_terms
      puts '#######'
      puts results
      puts '######'
      results['RetailigenceSearchResult']['results'].each do |r|
        @products << r['SearchResult']
      end


    end
  end

  # GET /search/1
  # GET /search/1.json
  def show
  end

  # GET /search/new
  def new
    @search = Search.new
  end





  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search
      @search = Search.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def search_params
      params[:search]
    end
end

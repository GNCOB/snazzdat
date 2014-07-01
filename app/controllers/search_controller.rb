class SearchController < ApplicationController

  # GET /search
  # GET /search.json
  def index
    @products = []
    if params[:search] && !get_location.nil?
      if current_user.nil?
        requester_id = request.uuid
      else
        requester_id = current_user.username
      end
      search_terms = {
          format:'json',
          userlocation: "#{get_location['lat']}, #{get_location['lng']}" ,
          Keywords: params[:search],
          Page: '1',
          pageSize: '100',
          requestorid: requester_id,
          range: '30',
          rcategory: 'Apparel'
      }
      puts "location: ---->"
      puts get_location.inspect
      product_search =  Retailigence::Product.new
      results = product_search.search search_terms

      unless results['RetailigenceSearchResult']['results'].nil?
        results['RetailigenceSearchResult']['results'].each do |r|
          @products << r['SearchResult']
        end
      end


    end
  end
end

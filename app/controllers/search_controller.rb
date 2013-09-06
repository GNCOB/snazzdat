class SearchController < ApplicationController
  before_action :set_search, only: [:show, :edit, :update, :destroy]

  # GET /search
  # GET /search.json
  def index
    @results = nil
    if params[:search]
      search_terms = {
          format:'json',
          userlocation: '20852',
          Keywords: params[:search],
          Page: '1',
          pageSize: '30',
          requestorid:'13cda9a1dc2c69e5',
          apikey: 'aIzdHVPfx5e20bav-Lx7xtdP7MK7usst'
      }
      r = Retailigence::Product.search search_terms
      @results = r['RetailigenceSearchResult']['results']
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

  # GET /search/1/edit
  def edit
  end

  # POST /search
  # POST /search.json
  def create
    @search = Search.new(search_params)

    respond_to do |format|
      if @search.save
        format.html { redirect_to @search, notice: 'Search was successfully created.' }
        format.json { render action: 'show', status: :created, location: @search }
      else
        format.html { render action: 'new' }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /search/1
  # PATCH/PUT /search/1.json
  def update
    respond_to do |format|
      if @search.update(search_params)
        format.html { redirect_to @search, notice: 'Search was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /search/1
  # DELETE /search/1.json
  def destroy
    @search.destroy
    respond_to do |format|
      format.html { redirect_to searches_url }
      format.json { head :no_content }
    end
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

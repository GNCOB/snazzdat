class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :my_matches]
  before_action :authenticate_user, only: [:edit, :update, :my_matches]


  def show
  end

  def new
    @user = User.new
    @has_error = false
  end

  def create
    @user = User.new(user_params)
    begin
      if @user.create
        user = User.authenticate params[:user][:username], params[:user][:password]
        if user
          session[:user_id] = user.id
          redirect_to root_url, notice: 'Account created successfully!'
        else
          render action: :new

        end
      end

    rescue  => e
      Rails.logger.debug "User create ERROR: #{e.message}"
      flash[:notice] = e.message
      render action: :new
    end

  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to user_path, notice: 'Account updated successfully'
    end
  end

  def my_matches
    @matches = nil

    unless @user.gender.blank?
      @matches =  Rails.cache.fetch("my-matches-#{current_user.id}", expires_in: 1.hour) do
        puts "CACHE HIT"
        matches_array = []
        if @user.gender == "Male"
          MyMatchesConstants::MEN.each do |match|
            keywords =  "Men's " + match
            search_attrs = {
                format:'json',
                userlocation: "#{get_location[:lat]}, #{get_location[:lng]}" ,
                Keywords: keywords,
                Page: '1',
                pageSize: '5',
                requestorid: @user.username,
                range: '30',
                rcategory: 'Apparel'
            }

            product_search =  Retailigence::Product.new
            results = product_search.search search_attrs

            unless results['RetailigenceSearchResult']['results'].nil?
              matches_array  << results['RetailigenceSearchResult']['results'].first['SearchResult']
            end
          end

        else
          MyMatchesConstants::WOMEN.each do |match|
            keywords =  "Women's " + match
            search_attrs = {
                format:'json',
                userlocation: "#{get_location[:lat]}, #{get_location[:lng]}" ,
                Keywords: keywords,
                Page: '1',
                pageSize: '5',
                requestorid: @user.username,
                range: '30',
                rcategory: 'Apparel'
            }

            product_search =  Retailigence::Product.new
            results = product_search.search search_attrs

            unless results['RetailigenceSearchResult']['results'].nil?
              matches_array  << results['RetailigenceSearchResult']['results'].first['SearchResult']
            end
          end
        end
        matches_array
      end
    end


  end
  private

  def set_user
    @user ||= current_user
  end

  def user_params
    params.require(:user).permit(:username, :email, :name, :password, :gender)
  end



end

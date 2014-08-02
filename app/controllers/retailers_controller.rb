class RetailersController < ApplicationController

  def create
    if Retailer.where(place_id: params[:place_id]).count > 0  # already exists, update
      retailer = Retailer.where(place_id: params[:place_id]).first
      retailer.request_count+=1
      retailer.save
    else
      retailer = Retailer.new(place_id:params[:place_id], name:params[:name])
      retailer.request_count=1
      retailer.save
    end
    head :no_content
  end

end

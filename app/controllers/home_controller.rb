class HomeController < ApplicationController

  def index
    @r = Retailer.all(userlocation: "#{get_location['lat']}, #{get_location['lng']}")
  end
end

class HomeController < ApplicationController

  def index
    puts '########'
    puts current_user.inspect
    puts '######'
  end
end

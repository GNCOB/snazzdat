class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :get_location


    def get_location
      @current_location = session[:current_location]

      #render json:  { current_location: session[:current_location] }
    end

    def set_location
      if !params[:lat].blank? && !params[:lng].blank?
        zip = '20001'


        session[:current_location] =  {lat:params[:lat], lng: params[:lng], zip_code: zip }
      end
      head :no_content
    end


end

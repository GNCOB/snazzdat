class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  prepend_before_action :set_location
  helper_method :current_user
  helper_method :get_location

  def set_location
    zip = '20001'
    session[:current_location] = {lat: "38.8951", lng: "-77.0367", zip_code: zip}
    #head :no_content
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_user
    redirect_to log_in_path if current_user.nil?
  end

  def get_location
    if session[:current_location].blank?
      set_location
    end
    @current_location ||= session[:current_location]

  end

end

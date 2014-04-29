class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  prepend_before_action :set_location
  helper_method :current_user
  helper_method :get_location

  def set_location
    if cookies[CookieConstants::USER_LOCATION].blank?
      res = Geokit::Geocoders::IpGeocoder.geocode(request.remote_ip)
      if res.success
        cookies[CookieConstants::USER_LOCATION] = {value: {lat:res.lat, lng: res.lng}.to_json }
      else
        cookies[CookieConstants::USER_LOCATION] = {value: {lat:"38.8951", lng: "-77.0367"}.to_json } # Default to DC area
      end
    end
    #head :no_content

=begin
    if !params[:lat].blank? && !params[:lng].blank? && cookies[CookieConstants::USER_LOCATION].blank?
      res = Geokit::Geocoders::GoogleGeocoder.reverse_geocode("#{params[:lat]}, #{params[:lng]}")
      if res.success
        cookies[CookieConstants::USER_LOCATION] = {value: res.zip}
      end
    end
=end
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_user
    redirect_to log_in_path  if current_user.nil?
  end

  def get_location
    if cookies[CookieConstants::USER_LOCATION].blank?
      set_location
    end
    ActiveSupport::JSON.decode cookies[CookieConstants::USER_LOCATION]
  end

end

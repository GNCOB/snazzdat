class RetailersController < ApplicationController
  before_action only: [:show, :edit, :update, :destroy]

  # GET /retailers
  # GET /retailers.json
  def index
    @retailers = Retailer.all(userlocation: "#{get_location['lat']}, #{get_location['lng']}")
  end

# GET /appointment/new
  def create_appointment
    @appointment = Appointment.new(retailer_params)
  end

  private
# Never trust parameters from the scary internet, only allow the white list through.
  def retailer_params
    params[receiver: :@retailer]
  end
end

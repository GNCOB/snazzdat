class AppointmentsController < ApplicationController
  before_action :authenticate_user

  def new
    @appointment = Appointment.new
    @has_error = false
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.attributes = {user: current_user.to_pointer}
    # setting more attributes, then saving
    if @appointment.save
      redirect_to action: :index
    else
      render action: :new
    end

  end

  def show

  end

  def index
    @appointments = Appointment.all
  end

  def edit

  end

  def update
    if @appointment.update(@appointment_params)
      flash[:notice] = "Appointment Updated."
    else
    end
    render action: :edit
  end

  private

  def set_appointment
    @appointment ||= current_appointment
  end

  def current_appointment
    # code here
  end

  def appointment_params
    params.require(:appointment).permit(:user, :receiver, :city, :zip_code, :email, :date)
  end
end

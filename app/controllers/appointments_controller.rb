class AppointmentsController < ApplicationController
  before_action :authenticate_user

  def new
    @appointment = Appointment.new
    @appointment.attributes = {user: current_user.to_pointer}
    #test data
    @appointment.attributes = {receiver: params[:receiver]}
    @has_error = false
  end

  def create
    @appointment = Appointment.new(params[:id])
    @appointment.update_attributes(appointment_params)
    @appointment.attributes = {user: current_user.to_pointer}
    # setting more attributes, then saving
    if @appointment.save
      redirect_to action: :index
    else
      render action: :new
    end

  end

  def show
    set_appointment
  end

  def index
    @appointments = Appointment.where(:user => current_user.to_pointer)
  end

  def edit
    set_appointment
  end

  def update
    @appointment = Appointment.find(params[:id])
    if @appointment.update(appointment_params)
      redirect_to action: :show
      flash[:notice] = "Appointment Updated."
    else
      render action: :edit
    end
  end

  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url_url }
      format.json { head :no_content }
    end
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:user, :receiver, :city, :zip_code, :email, :date)
  end
end

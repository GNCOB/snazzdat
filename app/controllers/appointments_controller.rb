class AppointmentsController < ApplicationController
  before_action :authenticate_user
  #before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  def new
    @appointment = Appointment.new
    @appointment.attributes = {user: current_user.to_pointer}
    #test data
    @appointment.attributes = {receiver: params[:receiver]}
    @has_error = false
  end

  def create
    @appointment = Appointment.new(params[:appointment])
    @appointment.attributes = {user: current_user.to_pointer}
    # setting more attributes, then saving
    if @appointment.save
      @query = Partner.find(@appointment.attributes['receiver'])
      @partner_name = @query.attributes['name']
      redirect_to appointment_path
    else
      render action: :new
    end

  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def index
    @appointments = Appointment.where(:user => current_user.to_pointer)
  end

  def edit

    @appointment = Appointment.find(params[:id])
  end

  def update
    #update
    @appointment = Appointment.find(params[:id])
    @appointment.update_attributes(params[:appointment])
    if @appointment.save
      redirect_to appointment_path
      flash[:notice] = "Appointment Updated."
    else
      render action: :edit
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_path }
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

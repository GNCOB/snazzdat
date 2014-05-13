class AppointmentsController < ApplicationController
  before_action :authenticate_user
  before_action :load_appointment, except: [:new, :create, :select_partner, :index]
  before_action :load_partner, only: [:new, :create, :edit, :update]
  def new
    redirect_to action: :select_partner if @partner.nil?
    @appointment = Appointment.new(user_id: current_user.id, partner_id: params[:partner_id], email: current_user.email)
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.attributes = {user: current_user.to_pointer, partner: @partner}
    @appointment.date = Date.strptime(appointment_params[:date], '%m/%d/%Y')
    if @appointment.save
      #@query = Partner.find(@appointment.attributes['receiver'])
      #@partner_name = @query.attributes['name']
      redirect_to user_appointments_path
    else
      render :new, partner_id: @partner.id
    end

  end

  def show
  end

  def index
    @appointments = Appointment.where(user: current_user.to_pointer)
  end

  def edit
  end

  def update
    #update
    @appointment.date = Date.strptime(appointment_params[:date], '%m/%d/%Y')
    if @appointment.update(appointment_params)
      redirect_to user_appointment_path
      flash[:notice] = "Appointment Updated."
    else
      render :edit
    end
  end

  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to user_appointments_path }
      format.json { head :no_content }
    end
  end

  def select_partner
    @partners = Partner.all
  end

  private

  def load_appointment
    @appointment = Appointment.find(params[:id])
  end

  def load_partner
    @partner = params[:partner_id].present? ? Partner.find(params[:partner_id]) : nil
  end

  def appointment_params
    params.require(:appointment).permit(:receiver, :city, :zip_code, :email, :date)
  end
end

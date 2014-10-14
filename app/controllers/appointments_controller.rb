class AppointmentsController < ApplicationController
  before_action :authenticate_user
  before_action :load_appointment, except: [:new, :create, :select_partner, :index]
  before_action :load_partner, only: [:new, :create, :update]
  def new
    redirect_to action: :select_partner if @partner.nil?
    @appointment = Appointment.new(user_id: current_user.id, partner_id: params[:partner_id], email: current_user.email)
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.attributes = {user: current_user.to_pointer, partner: @partner}
    @appointment.date =  Appointment.to_date_object(set_date(params[:appointment]))

    #create appointment_items
    appointment_item_types = appointment_item_params[:item_type_code]
    a = AppointmentItem.new(appointment_item_params)
    a.item_type_code = appointment_item_types.reject(&:blank?).reject(&:nil?).map(&:to_i)

    if @appointment.save
      a.attributes = {appointment: @appointment.to_pointer}
      a.save
      AppointmentsMailer.user_new_appointment_notification(@appointment).deliver
      AppointmentsMailer.partner_new_appointment_notification(@appointment).deliver
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
    @partner = @appointment.partner
  end

  def update
    new_appointment_params = appointment_params
    new_appointment_params[:date] = Appointment.to_date_object(set_date(params[:appointment]))
    @appointment.date = new_appointment_params[:date]

    #update appointment_items
    a = AppointmentItem.find(@appointment.appointment_item.id)
    a.attributes = appointment_item_params
    appointment_item_types = appointment_item_params[:item_type_code]
    a.item_type_code = appointment_item_types.reject(&:blank?).reject(&:nil?).map(&:to_i)

    if @appointment.valid? && @appointment.update(new_appointment_params)
      a.update
      redirect_to user_appointment_path
      flash[:notice] = "Appointment Updated."
    else
      render :edit
    end
  end

  def destroy
    @appointment.appointment_item.destroy if @appointment.appointment_item.present?
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
    params.require(:appointment).permit(:notes, :budget, :phone_number, )
  end

  def appointment_item_params
    params.require(:appointment_item).permit(:jeans_style,:shoes_style, :shoes_size, item_type_code: [], jeans_size: [])
  end

  def set_date appointment_from_params
    DateTime.strptime("#{appointment_from_params['date(2i)']}/#{appointment_from_params['date(3i)']}/#{appointment_from_params['date(1i)']}  #{appointment_from_params['date(4i)']}:#{appointment_from_params['date(5i)']}#{Time.zone.formatted_offset}", '%m/%d/%Y %H:%M%z')
  end
end

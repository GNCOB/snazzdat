class AppointmentsMailer < ActionMailer::Base
  default from: "info@snazzdat.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.appointments_mailer.new_appointment_notification.subject
  #
  def new_appointment_notification appointment
    @user = appointment.user
    @partner = appointment.partner
    mail to: appointment.email
  end
end

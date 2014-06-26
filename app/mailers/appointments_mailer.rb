class AppointmentsMailer < ActionMailer::Base
  default from: "info@snazzdat.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.appointments_mailer.new_appointment_notification.subject
  #
  def user_new_appointment_notification appointment
    @appointment = appointment
    mail to: appointment.user.email, subject: "New appointment notification for #{@appointment.partner.name}"
  end

  def partner_new_appointment_notification appointment
    @appointment = appointment
    mail to: appointment.partner.email, subject: "New appointment notification for #{@appointment.user.name}"
  end
end

require 'test_helper'

class AppointmentsMailerTest < ActionMailer::TestCase
  test "new_appointment_notification" do
    mail = AppointmentsMailer.new_appointment_notification
    assert_equal "New appointment notifacation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end

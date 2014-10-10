class Appointment < ParseResource::Base
  belongs_to :user
  belongs_to :partner
  fields :date, :notes, :budget, :phone_number
  validates :date, :budget, presence: true
  validate :is_date_in_past?

  def is_date_in_past?
    if date.present? && date < Time.zone.now
      errors.add(:date, 'Appointment date and time cannot be in the past')
    end
  end

  def appointment_item
    AppointmentItem.where(appointment: self.to_pointer).first
  end
end

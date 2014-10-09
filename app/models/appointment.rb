class Appointment < ParseResource::Base
  belongs_to :user
  belongs_to :partner
  has_many :appointment_item
  fields :date, :notes, :budget, :phone_number, :appointment_item_type_codes
  validates :date, :budget, presence: true
  validate :is_date_in_past?

  def is_date_in_past?
    if date.present? && date < Time.zone.now
      errors.add(:date, 'Appointment date and time cannot be in the past')
    end
  end
end

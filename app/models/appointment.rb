class Appointment < ParseResource::Base
  belongs_to :user
  belongs_to :partner
  #has_one :location
  fields :date, :notes, :budget
  validates :date, :budget, presence: true
  validate :is_date_in_past?

  def is_date_in_past?
    if date.present? && date < DateTime.now
      errors.add(:date, 'Appointment date and time cannot be in the past')
    end
  end
end

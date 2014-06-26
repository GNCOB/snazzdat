class Appointment < ParseResource::Base
  belongs_to :user
  belongs_to :partner
  #has_one :location

  #before_save :parse_date

  fields :date, :notes
  validates :date, presence: true
  attr_accessor :temp_date, :temp_time

  private

  def parse_date
    self.date = Appointment.to_date_object Date.strptime(date, '%m/%d/%Y')
  end

end

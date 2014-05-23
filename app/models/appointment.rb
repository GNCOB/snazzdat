class Appointment < ParseResource::Base
  belongs_to :user
  belongs_to :partner
  before_save :parse_date

  fields :receiver, :city, :zip_code, :email, :date
  validates :city, :zip_code, :email, :date, presence: true

  private

  def parse_date
    self.date = Appointment.to_date_object Date.strptime(date, '%m/%d/%Y')
  end

end

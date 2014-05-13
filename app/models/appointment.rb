class Appointment < ParseResource::Base
  belongs_to :user
  belongs_to :partner

  fields :receiver, :city, :zip_code, :email, :date
  validates :city, :zip_code, :email, :date, presence: true

end

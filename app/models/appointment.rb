class Appointment < ParseResource::Base
  belongs_to :user
  fields :receiver, :city, :zip_code, :email, :date

end

class Appointment < ParseResource::Base
  belongs_to :user
  belongs_to :partner
  #has_one :location
  fields :date, :notes, :budget
  validates :date, presence: true
  attr_accessor :temp_date, :temp_time

end

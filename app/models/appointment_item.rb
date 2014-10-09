class AppointmentItemType < ParseResource::Base
  belongs_to :appointment

  fields :item_type_code

end
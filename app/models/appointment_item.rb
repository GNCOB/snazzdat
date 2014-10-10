class AppointmentItem < ParseResource::Base
  belongs_to :appointment

  fields :item_type_code, :jeans_style, :jeans_size, :shoes_style, :shoes_size

end
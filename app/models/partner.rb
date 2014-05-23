class Partner < ParseResource::Base
  belongs_to :user
  fields :name, :address1, :address2, :city, :state, :zip_code, :email, :phone
  validates :name, :email, :phone, presence: true
  validates :phone, numericality: {only_integer: true}

end

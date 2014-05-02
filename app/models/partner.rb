class Partner < ParseResource::Base
  belongs_to :user
  fields :name, :address, :email, :phone
  validates :name, :email, :phone, presence: true
  validates :phone, numericality: {only_integer: true}
end

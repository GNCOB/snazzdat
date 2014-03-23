class User < ParseUser
  validates_presence_of :username, message: 'Username is a required field'
  validates_presence_of :email, on: :create,  message: 'Email is a required field'
  validates_presence_of :password, on: :create
  validates_presence_of :password_confirmation, on: :create, message: 'Please confirm you password'
  validates_presence_of :terms_of_use, on: :create
  validate :confirm_password
  validates :email, presence: true, email: true

  fields :email, :name, :gender, :terms_of_use, :password_confirmation

  def size
    Size.where(user: self.to_pointer).first
  end

  def confirm_password
    false if (self.password != self.password_confirmation) && self.new?
  end

end

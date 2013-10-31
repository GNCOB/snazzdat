class User < ParseUser
  validates_presence_of :username, message: 'Username is a required field'
  validates_presence_of :email, on: :create,  message: 'Email is a required field'
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, on: :create, message: "Please enter a valid email"
  validates_presence_of :password, on: :create, confirmation: true
  validates_presence_of :terms_of_use, on: :create

  fields :email, :name, :gender, :terms_of_use

  def size
    Size.where(user: self.to_pointer).first
  end

end

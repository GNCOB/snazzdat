class User < ParseUser
  validates_presence_of :username, message: 'Username is a required field'
  validates_presence_of :email, message: 'Email is a required field'
  validates_presence_of :password, on: :create
  validates_presence_of :terms_of_use

  fields :email, :full_name, :gender, :terms_of_use

  def size
    Size.where(user: self.to_pointer).first
  end

end

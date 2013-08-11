# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'DEFAULT USERS'
User.create :first_name => 'Nii', :last_name => 'Ankrah',  :email => 'nankrah007+first@gmail.com', :role => 'admin', :password => 'password', :password_confirmation => 'password'
User.create :first_name => 'Selasie', :last_name => 'Ankrah',  :email => 'nankrah007+second@gmail.com', :role => 'user', :password => 'password', :password_confirmation => 'password'
User.create :first_name => 'Annelie', :last_name => 'Ankrah',  :email => 'nankrah007+third@gmail.com', :role => 'vendor', :password => 'password', :password_confirmation => 'password'
puts 'FINISHED CREATING USERS'

puts 'DEFAULT SIZES'
Size.create :waist => 20, :hips => 10, :bust => 38, :neck => 6, :shoulder => 40, :user_id => 1

puts 'FINISHED CREATING SIZES'
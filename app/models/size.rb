class Size < ParseResource::Base
  validates_presence_of :user_id

  fields :user_id, :neck, :chest, :sleeve, :bust, :waist, :hips, :inseam, :height, :weight, :body_shape_code
  #belongs_to :user


end

class Size < ParseResource::Base
  belongs_to :user
  fields :neck, :chest, :sleeve, :bust, :waist, :hips, :inseam, :height, :weight, :body_shape_code


end

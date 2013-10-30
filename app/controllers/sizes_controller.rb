class SizesController < ApplicationController
  before_action :get_size

  def new
    @size = Size.new(user_id: current_user.id)
  end

  def create
    @size = Size.new(size_params)
    if @size.save
      redirect_to root_url
    else
      render action: :new
    end
  end

  def show

  end

  def index

  end


  def edit
    #redirect_to root_url if @size.blank?
  end

  def update
    if @size.update(size_params)
      flash[:notice] = "Profile Updated."
    else
    end
    render action: :edit
  end

  private
    def get_size
      @size = Size.where(objectId: params[:id], user_id: current_user.id).first

    end

    def size_params
      params.require(:size).permit(:neck, :chest, :sleeve, :bust, :waist, :hips, :inseam, :height, :weight, :body_shape_code, :user_id)
    end
end
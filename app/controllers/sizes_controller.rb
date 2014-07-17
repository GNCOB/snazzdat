class SizesController < ApplicationController
  before_action :authenticate_user
  before_action :get_size, except: [:create]

  def new
    redirect_to action: :index if @size.present?
    @size = Size.new(user_id: current_user.id)
  end

  def create
    @size = Size.new(size_params)
    @size.attributes = {user: current_user.to_pointer}
    if @size.save
      redirect_to action: :index
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
    @size.attributes = {user: current_user.to_pointer}
    if @size.update(size_params)
      flash[:notice] = "Profile Updated."
      redirect_to action: :show
    else
      redirect_to action: :index
    end
  end

  private
    def get_size
      @size = Size.where(objectId: params[:id], user: current_user.to_pointer).first

    end

    def size_params
      params.require(:size).permit(:neck, :chest, :sleeve, :bust, :waist, :hips, :inseam, :height, :weight, :body_shape_code, :user)
    end
end
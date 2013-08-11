class SizesController < ApplicationController
  before_action :get_size

  def index

  end

  def show

  end

  def edit

  end

  def update
    unless params[:size].empty?
      @size.update(size_params)
    end
    render 'home/index'
  end

  private
    def get_size
      @size = params[:id].nil? ? Size.find_by_user_id(params[:user_id]) : Size.find(params[:id])
    end

    def size_params
      params.require(:size).permit(:waist, :hips, :neck, :shoulder, :inseam, :height, :foot, :bust)
    end
end
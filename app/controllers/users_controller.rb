class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]
  before_action :authenticate_user, only: [:edit, :update]


  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    begin
      if @user.create
        user = User.authenticate params[:user][:username], params[:user][:password]
        if user
          session[:user_id] = user.id
          redirect_to root_url, notice: 'Account created successfully!'
        else
          render action: :new

        end
      end

    rescue  => e
      Rails.logger.debug "User create ERROR: #{e.message}"
      render action: :new
    end

  end

  def edit

  end

  def update

  end

  private

  def set_user
    @user ||= current_user
  end

end

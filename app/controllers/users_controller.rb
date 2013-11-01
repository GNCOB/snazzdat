class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]
  before_action :authenticate_user, only: [:edit, :update]


  def show
  end

  def new
    @user = User.new
    @has_error = false
  end

  def create
    @user = User.new(user_params)
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
      flash[:notice] = e.message
      render action: :new
    end

  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to user_path, notice: 'Account updated successfully'
    end
  end

  private

  def set_user
    @user ||= current_user
  end

  def user_params
    params.require(:user).permit(:username, :email, :name, :password)
  end

end

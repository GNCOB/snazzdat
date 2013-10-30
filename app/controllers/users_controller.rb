class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]


  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.authenticate(params[:user][:username], params[:user][:password])
      redirect_to root_url, notice: 'Account created successfully!'
    else
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

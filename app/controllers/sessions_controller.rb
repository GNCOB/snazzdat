class SessionsController < ApplicationController

  def new
  end

  def create
    if params[:facebook] == 'login'
      user = User.authenticate_with_facebook(params[:user_id], params[:access_token], params[:expires])
    else
      user = User.authenticate(params[:username], params[:password])
    end
    if user
      session[:user_id] = user.id
      redirect_to root_url({facebook: params[:facebook] == 'login'}), notice: "Logged In"
    else
      flash[:error] = "Invalid email or password"
      render action: :new
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged Out"
  end

  def password_reset
    if User.reset_password(params[:reset][:email])
      flash[:notice] = "You will receive an email with instructions to reset your password"
    else
      flash[:notice] = "Sorry, we could not find an account with the email provided."
    end
    render :password_reset_form
  end

  def password_reset_form

  end

end

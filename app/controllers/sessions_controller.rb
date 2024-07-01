class SessionsController < ApplicationController
  def new
  end

  def create
    puts params
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "You logged in successfully."

      redirect_to user_path(user)
    else
      flash.now[:alert] = "Invalid login credentials."

      render 'new', status: :unprocessable_content
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You logged out successfully."

    redirect_to root_path
  end
end
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to questions_path
      render json: { token: user.api_token }
    else
      flash[:error_message] = "Something went wrong. Please try again!"
      redirect_to new_session_path
      render json: { error: "Invalid" }, status: :unauthorized
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've been successfully logged out"
    redirect_to questions_path
  end
end

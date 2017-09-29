class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: user
    else
      render json: {errors: "login failed."}
    end
  end

  def destroy
    if session.clear
      render json: {message: "session was cleared"}
    else
      render json: {message: "something went wrong, sessions was NOT cleared"}
    end
  end
end
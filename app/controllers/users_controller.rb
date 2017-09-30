class UsersController < ApplicationController

  def show
    user = User.find_by(id: params[:id])
    if user
      render json: user.json_data
    else
      render json: {error: "user cannot be found"}
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      render json: user
    else
      render json: {errors: user.errors.full_messages}
    end
  end

  def find
    user = User.find_by(email: params[:email])
    if user
      render json: user
    else
      render json: {error: "That email is not associated with any User"}
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end

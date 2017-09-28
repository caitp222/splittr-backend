class UsersController < ApplicationController

  def show
    user = User.find_by(id: params[:id])
    render json: user
  end

  def new
    User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to_user_path(user)
    else
      render json: user.errors.full_messages
  end

  def find

  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end

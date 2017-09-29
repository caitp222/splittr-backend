class UsersController < ApplicationController

  def show
    user = User.find_by(id: params[:id])
    render json: user
  end

  def new
    User.new
  end

  def create
    puts params
    puts user_params
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user
    else
      render json: user.errors.full_messages
    end
  end

  def find

  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end

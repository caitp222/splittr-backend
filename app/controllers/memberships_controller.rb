class MembershipsController < ApplicationController

  def create
  end

  private
  def membership_params
    params.require(:membership).permit(:user_id, :group_id, :email, :password)
  end
end
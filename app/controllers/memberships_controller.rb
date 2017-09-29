class MembershipsController < ApplicationController

  def create
    membership = Membership.new(membership_params)
    if membership.save
      render json: membership
    else
      render json: {errors: membership.errors.full_messages
    end
  end

  private
  def membership_params
    params.require(:membership).permit(:user_id, :group_id)
  end
end
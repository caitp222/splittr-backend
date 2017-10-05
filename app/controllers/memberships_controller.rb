class MembershipsController < ApplicationController

  def create
    @member = User.find_by(email: params[:email])
    @group = Group.find_by(id: params[:groupId])
    if @member != nil && @group != nil
      @membership = Membership.new(user: @member, group: @group)
      if @membership.save
        render json: @group.json_data
      end
    else
      status 422
    end
  end

  private
  def membership_params
    params.require(:membership).permit(:user_id, :group_id)
  end
end

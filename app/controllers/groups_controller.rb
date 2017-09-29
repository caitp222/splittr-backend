class GroupsController < ApplicationController

  def new
  end

  def create
  end

  def show
  end

  def settle
  end

  private
  def group_params
    params.require(:group).permit(:groups_name, :details, :creator_id, :settled_up)
  end
end
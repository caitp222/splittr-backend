class ExpensesController < ApplicationController

  def new
  end

  def create
  end

  def show
  end

  private
  def expense_params
    params.require(:expense).permit(:amount, :vendor, :description, :membership_id, :name)
  end
end
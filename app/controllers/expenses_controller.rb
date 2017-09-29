class ExpensesController < ApplicationController

  def create
    expense = Expense.new(expense_params)
    if expense.save
      render json: expense
    else
      render json: {errors: expense.errors.full_messages}
    end
  end

  def show
    expense = Expense.find_by(id: params[:id])
    if expense
      render json: expense
    else
      render json: {error: "Expense does not exist, please try again"}
    end
  end

  def destroy
    expense = expense.find(params[:id])
    if expense.destroy
      render json: {message: "Delete successful"}
    else
      render json: {message: "Something went wrong"}
    end
  end

  private
  def expense_params
    params.require(:expense).permit(:amount, :vendor, :description, :membership_id)
  end
end
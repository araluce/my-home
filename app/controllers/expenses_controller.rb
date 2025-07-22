class ExpensesController < ApplicationController
  def index
    @expenses = Current.user.expenses.order(date: :desc)
  end

  def new
    @expense = Current.user.expenses.build
  end

  def create
    @expense = Current.user.expenses.build(expense_params)

    if @expense.save
      redirect_to expenses_path, notice: 'Gasto creado con éxito'
    else
      render :new
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:title, :amount, :date, :expense_type, :month)
  end
end

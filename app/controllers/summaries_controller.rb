class SummariesController < ApplicationController
  def show
    @month = params[:month] ? Date.parse(params[:month]) : Date.today.beginning_of_month
    @users = User.all
    @balances = MonthlyBalanceCalculator.new(@month, @users).call

    @salaries = Salary.where(month: @month).includes(:user)

    total_income = @salaries.sum(&:amount)
    @efforts = @salaries.map do |s|
      {
        user: s.user,
        amount: s.amount,
        percentage: ((s.amount.to_f / total_income) * 100).round(2)
      }
    end

    expenses = Expense.where(month: @month).includes(:created_by)
    @grouped_expenses = expenses.group_by(&:expense_type)
  end
end

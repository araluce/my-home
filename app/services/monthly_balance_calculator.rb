class MonthlyBalanceCalculator
  attr_reader :month, :users

  def initialize(month, users)
    @month = month.beginning_of_month
    @users = users
  end

  def call
    per_user_balance = users.index_with { 0 }

    Expense.where(month: month).each do |expense|
      case expense.expense_type
      when "common"
        users.each do |user|
          per_user_balance[user] -= expense.amount * effort_ratio(user)
        end
        per_user_balance[expense.created_by] += expense.amount
      when "shared"
        share = expense.amount / users.size.to_f
        users.each { |user| per_user_balance[user] -= share }
        per_user_balance[expense.created_by] += expense.amount
      when "assigned"
        per_user_balance[expense.created_by] += expense.amount
      end
    end

    per_user_balance
  end

  def effort_ratio(user)
    salaries, total_salary = salary_resume
    return 0 if total_salary.zero?

    salary = user.salaries.find_by(month: month)&.amount || 0
    salary / total_salary.to_f
  end

  private

  def salary_resume
    @salary_resume ||= begin
      salaries = users.index_with { |u| u.salaries.find_by(month: month)&.amount || 0 }
      total_salary = salaries.values.sum
      [salaries, total_salary]
    end
  end
end

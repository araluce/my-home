class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  has_many :monthly_incomes
  has_many :expenses, foreign_key: :created_by_id
  has_many :assigned_expenses, class_name: 'Expense', foreign_key: :assigned_to_id
  has_many :expense_participants
  has_many :salaries, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  def salary
    salaries.order(month: :desc).first
  end
end

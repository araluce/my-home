class Expense < ApplicationRecord
  belongs_to :created_by, class_name: 'User', foreign_key: 'created_by_id'

  has_many :expense_participants
  has_many :users, through: :expense_participants

  enum :expense_type, { common: 0, shared: 1, assigned: 2 }

  validates :title, :amount, :expense_type, :month, presence: true
end

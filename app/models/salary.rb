class Salary < ApplicationRecord
  belongs_to :user

  validates :amount, :month, presence: true
end

# Users
user1 = User.find_or_create_by!(email_address: 'ana@example.com') do |u|
  u.password = 'password'
  u.name = 'Ana'
end

user2 = User.find_or_create_by!(email_address: 'luis@example.com') do |u|
  u.password = 'password'
  u.name = 'Luis'
end

Salary.create!(user: user1, amount: 2000, month: Date.new(2025, 7, 1))
Salary.create!(user: user2, amount: 1500, month: Date.new(2025, 7, 1))

# Expenses
Expense.create!(
  title: 'Hipoteca',
  amount: 800,
  expense_type: :common,
  created_by: user1,
  month: Date.new(2025, 7, 1)
)

Expense.create!(
  title: 'Internet',
  amount: 50,
  expense_type: :common,
  created_by: user2,
  month: Date.new(2025, 7, 1)
)

Expense.create!(
  title: 'Cena fuera',
  amount: 60,
  expense_type: :shared,
  created_by: user1,
  month: Date.new(2025, 7, 1)
)

Expense.create!(
  title: 'Zapatos personales',
  amount: 90,
  expense_type: :assigned,
  created_by: user2,
  month: Date.new(2025, 7, 1)
)

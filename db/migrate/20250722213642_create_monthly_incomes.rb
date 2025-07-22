class CreateMonthlyIncomes < ActiveRecord::Migration[8.0]
  def change
    create_table :monthly_incomes do |t|
      t.references :user, null: false, foreign_key: true
      t.date :month
      t.decimal :amount

      t.timestamps

      t.index [:user_id, :month], unique: true
    end
  end
end

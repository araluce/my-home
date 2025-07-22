class CreateRecurringExpenses < ActiveRecord::Migration[8.0]
  def change
    create_table :recurring_expenses do |t|
      t.string :title
      t.decimal :amount
      t.integer :expense_type
      t.references :created_by, null: false, foreign_key: { to_table: :users }
      t.integer :day_of_month

      t.timestamps
    end
  end
end

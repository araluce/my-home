class CreateExpenses < ActiveRecord::Migration[8.0]
  def change
    create_table :expenses do |t|
      t.string :title
      t.decimal :amount
      t.date :month
      t.integer :expense_type
      t.references :created_by, null: false, foreign_key: { to_table: :users }
      t.references :assigned_to, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end

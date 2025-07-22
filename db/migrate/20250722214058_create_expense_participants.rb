class CreateExpenseParticipants < ActiveRecord::Migration[8.0]
  def change
    create_table :expense_participants do |t|
      t.references :expense, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.decimal :percentage
      t.boolean :assigned

      t.timestamps
    end
  end
end

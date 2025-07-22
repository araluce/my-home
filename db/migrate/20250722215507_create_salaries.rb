class CreateSalaries < ActiveRecord::Migration[8.0]
  def change
    create_table :salaries do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :amount
      t.date :month

      t.timestamps
    end
  end
end

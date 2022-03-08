class CreateIncomes < ActiveRecord::Migration[6.1]
  def change
    create_table :incomes do |t|
      t.string :description
      t.float :amount
      t.string :date
      t.string :notes
      t.references :user
    end
  end
end

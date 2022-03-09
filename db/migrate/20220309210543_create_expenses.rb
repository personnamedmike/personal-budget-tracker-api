class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.string :description
      t.float :cost
      t.string :date
      t.string :frequency
      t.string :due_date
      t.boolean :paid
      t.string :notes
      t.references :user
    end
  end
end

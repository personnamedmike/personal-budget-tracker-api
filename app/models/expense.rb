class Expense < ActiveRecord::Base
    belongs_to :user

    def self.expenses_total
        # binding.pry
        monthly = all.sum(:monthly)
        puts "Total monthly expenses: $#{monthly}"
    end

    def self.current_month
        this_month = self.all.filter do |expense|
        date = Date.parse(expense.date)
        date.month == Date.today.month && date.year == Date.today.year
        end
        costs = this_month.pluck('cost').sum
    end
    

end
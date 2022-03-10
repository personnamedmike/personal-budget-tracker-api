class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  # get "/" do
  #   Personal Budget Tracker
  # end

  get "/expenses/:id" do
    expense = Expense.find(params[:id])
    expense.to_json
  end

  get "/expenses" do
    expenses = Expense.all.order('date')
    expenses.to_json
  end

  post "/add_expenses" do
    # binding.pry
    expense = Expense.create(
      description: params[:description],
      cost: params[:cost],
      date: params[:date],
      frequency: params[:frequency],
      due_date: params[:due_date],
      paid: params[:paid],
      notes: params[:notes]
    )
    expense.to_json
  end

  patch "/update_expense/:id" do
    # binding.pry
    expense = Expense.find(params[:id])
    expense.update(params)
    expense.to_json
  end

  get "/expenses_summary/:time" do
    case params[:time]
    when "current-month"
      this_month = Expense.all.filter do |expense|
        date = Date.parse(expense.date)
        date.month == Date.today.month && date.year == Date.today.year
      end
      costs = this_month.pluck('cost').sum
      costs.to_json
    when "last-month"
      last_month = Expense.all.filter do |expense|
        date = Date.parse(expense.date)
        date.month == Date.today.prev_month.month && date.year == Date.today.year
      end
      costs = last_month.pluck('cost').sum
      costs.to_json
    when "last-90-days"
      last_90 = Expense.all.filter do |expense|
        date = Date.parse(expense.date)
        date >= Date.today-90
        # binding.pry
      end
      costs = last_90.pluck('cost').sum
      costs.to_json
    when "current-year"
      current_year = Expense.all.filter do |expense|
        date = Date.parse(expense.date)
        Date.today.year == date.year
      end
      costs = current_year.pluck('cost').sum
      costs.to_json
    when "last-year"
      last_year = Expense.all.filter do |expense|
        date = Date.parse(expense.date)
        # Date.today.year == date.year-1
        date.year == Date.today.year-1
        # binding.pry
      end
      costs = last_year.pluck('cost').sum
      costs.to_json
    when "all-time"
      costs = Expense.all.pluck('cost').sum
      costs.to_json
    end
  end

  delete "/delete_expense/:id" do
    # binding.pry
    expense = Expense.find(params[:id])
    expense.destroy
  end

  get "/incomes/:id" do
    income = Income.find(params[:id])
    income.to_json
  end

  get "/incomes" do
    income = Income.all.order('date')
    income.to_json
  end

  post "/add_income" do
    # binding.pry
    income = Income.create(
      description: params[:description],
      amount: params[:amount]
    )
    income.to_json
  end

  patch "/update_incomes/:id" do
    income = Income.find(params[:id]).update(
      description: params[:description],
      amount: params[:amount]
    )
    income.to_json
  end

  delete '/delete_incomes/:id' do
    income = Income.find(params[:id])
    income.destroy
  end

  get "/incomes_summary/:time" do
    case params[:time]
    when "current-month"
      this_month = Income.all.filter do |income|
        date = Date.parse(income.date)
        date.month == Date.today.month && date.year == Date.today.year
      end
      total = this_month.pluck('amount').sum
      total.to_json
    when "last-month"
      last_month = Income.all.filter do |income|
        date = Date.parse(income.date)
        date.month == Date.today.prev_month.month && date.year == Date.today.year
      end
      total = last_month.pluck('amount').sum
      total.to_json
    when "last-90-days"
      last_90 = Income.all.filter do |income|
        date = Date.parse(income.date)
        date >= Date.today-90
        # binding.pry
      end
      total = last_90.pluck('amount').sum
      total.to_json
    when "current-year"
      current_year = Income.all.filter do |income|
        date = Date.parse(income.date)
        Date.today.year == date.year
      end
      total = current_year.pluck('amount').sum
      total.to_json
    when "last-year"
      last_year = Income.all.filter do |income|
        date = Date.parse(income.date)
        # Date.today.year == date.year-1
        date.year == Date.today.year-1
        # binding.pry
      end
      total = last_year.pluck('amount').sum
      total.to_json
    when "all-time"
      total = Income.all.pluck('amount').sum
      total.to_json
    end
  end

end

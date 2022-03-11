# Title:
"Personal Budget Tracker"

# Project Description:

This repository contains the backend architecture which was originally built to be used with this fronend: https://personnamedmike.github.io/personal-budget-tracker/.

We used Active Record for the database, Sinatra to build the API, and Ruby to add logic to the API.

This project was for "phase 3" of Flatiron School school's Software Engineering bootcamp. We had 4 days to complete a fullstack app. The assignment was to play around with Active Record, Sinatra, Ruby, and connect it with a React frontend.

In a sense, this project was a second iteration of tzjorden's and my app, "Unrekt Crypto Tracker." https://github.com/personnamedmike/unrekt-crypto-tracker. The key differences were that we wrote cleaner code this time, and implemented our own backend.

This first iteration of Personal Budget Tracker is less buggy than Unrekt Crypto Tracker, and is useful enough to use in your everyday life.

# How to Install and Run Personal Budget Tracker

Currently the best and most secure way to run this project is by forking and cloning both repositories. This repo you're currently in is for the api, and you can fork the frontend here https://personnamedmike.github.io/personal-budget-tracker/.

Running this app on your local machine and storing data on a local sqlite3 database will ensure a base level of privacy of your financial transactions.

# How to use this project

-Fork and clone this repository to your local machine
-cd into your project's directory. Use the following commands:
-To install Ruby Gems: $ bundle install
-Run migrations: $ bundle exec db:migrations
-To test the database with dummy data: $ bundle exec db:seed
-To start server: $ bundle exec rake console

Server should be running on http://localhost:9292.

If you wish to build on top of the project, you can explore the various endpoints in app/controllers/application_controller.rb

# Important endpoints:

# Add expense entry:
post '/add_expenses'

# Modify expense by id. Currently this is used to look up expenses by its "paid" boolean value.
patch 'update/expenses/:id'

# Delete expense entry:
delete 'delete_expense/:id'

# Add income entry: 
post '/add_income'

# Read all income entries: 
get '/incomes'

# Delete income entry:
delete '/delete_incomes/:id'

# Read expenses by time. Currently this can lookup an expense summary based on a few options: "current-month", "last-month", "last-90-days", "current-year", "last-year", "all time":
get '/expenses_summary/:time'

# Read incomes by time. Same as the previously mentioned endpoint, but for incomes:
get '/incomes_summary/:time'

# Credits
Other collaborators on this product:
TzJorden: https://github.com/tzjorden
JoshHayles: https://github.com/JoshHayles

--

MIT License

Copyright (c) 2022 PersonNamedMike

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
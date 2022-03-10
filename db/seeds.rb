Expense.destroy_all
User.destroy_all
Income.destroy_all

puts "🌱 Seeding spices..."

# Seed your database here

User.create(name: "Vladimir Biden")


10.times do
    Expense.create(
        description: Faker::ElectricalComponents.active,
        cost: rand(1..350),
        date: Faker::Date.backward(days: 365),
        frequency: "one-time",
        due_date: Faker::Date.forward(days: 60),
        paid: Faker::Boolean.boolean(true_ratio: 0.2),
        notes: Faker::Quote.singular_siegler,
        user_id: User.all.sample
    )
end


8.times do
    Income.create(
        description: Faker::Job.key_skill,
        amount: rand(2000..3000),
        date: Faker::Date.between(from: '2021-01-01', to:  Date.today),
        user_id: User.all.sample,
        notes: Faker::Quote.singular_siegler
    )
end

puts "✅ Done seeding!"

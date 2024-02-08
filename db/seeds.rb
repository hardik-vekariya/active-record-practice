# frozen_string_literal: true

# Seed authors
5.times do
  Author.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    title: Faker::Job.title
  )
end

# Seed suppliers
5.times do
  Supplier.create(
    name: Faker::Company.name
  )
end

# Seed customers
5.times do
  Customer.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    title: Faker::Name.prefix,
    email: Faker::Internet.email,
    visits: Faker::Number.between(from: 1, to: 20),
    order_count: Faker::Number.between(from: 1, to: 10),
    lock_version: 0
  )
end

# Seed books
10.times do
  book = Book.create(
    title: Faker::Book.title,
    year_published: Faker::Number.between(from: 1900, to: 2022),
    isbn: Faker::Code.isbn,
    price: Faker::Commerce.price(range: 10.0..100.0),
    out_of_print: Faker::Boolean.boolean,
    views: Faker::Number.between(from: 0, to: 1000),
    supplier_id: Supplier.pluck(:id).sample,
    author_id: Author.pluck(:id).sample
  )

  # Assign books to orders
  5.times do
    order = Order.find_or_create_by(
      date_submitted: Faker::Time.between(from: DateTime.now - 365, to: DateTime.now),
      status: Order.statuses.keys.sample,
      subtotal: Faker::Commerce.price(range: 10.0..100.0),
      shipping: Faker::Commerce.price(range: 5.0..20.0),
      tax: Faker::Commerce.price(range: 1.0..10.0),
      total: Faker::Commerce.price(range: 50.0..200.0),
      customer_id: Customer.pluck(:id).sample
    )
    book.orders << order
  end
end

# Seed reviews
25.times do
  Review.create(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    rating: Faker::Number.between(from: 1, to: 5),
    state: Review.states.keys.sample,
    customer_id: Customer.pluck(:id).sample,
    book_id: Book.pluck(:id).sample
  )
end

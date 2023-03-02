puts "🌱 Seeding data..."
# run a loop 50 times
50.times do
    # create a game with random data
    product = Product.create(
      name: Faker::Commerce.product_name,
      price: rand(0..100) # random number between 0 and 100
    )

    user = User.create(
      name: Faker::Name.name
    )
  
    # # create between 0 and 10 reviews for each product
    rand(0..10).times do
      Review.create(
        product_id: product.id,
        user_id: user.id,
        star_rating: rand(0..10),
        comment: Faker::Lorem.sentence     
      )
    end
  end
  
puts "🌱 Done seeding!"
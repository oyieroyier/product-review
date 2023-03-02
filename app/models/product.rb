class Product < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews

  # creates a new Review in the database associated with this Product and the User
  def leave_review(user, star_rating, comment)
    Review.create(user_id: user.id, star_rating: star_rating, comment: comment)
  end

  # This should puts in the terminal a string representing each review for this product
  def print_all_reviews
    puts(
      self.reviews.map do |review|
        "Review for #{review.product.name} by #{review.user.name}: #{review.star_rating}. #{review.comment}"
      end
    )
  end

  # Returns a float representing the average star rating for all reviews for this product
  def average_rating
    self.reviews.average(:star_rating).to_f
  end
end

class User < ActiveRecord::Base
   has_many :reviews
   has_many :products, through: :reviews

   # Returns the product instance that has the highest star rating from this user
   def favorite_product
        self.reviews.order(:star_rating).last.product
    end

   #  Takes a Product (an instance of the Product class) and removes all of this user's reviews for that product
    def remove_reviews(product)
        self.reviews.where(product: product).destroy_all
    end
end
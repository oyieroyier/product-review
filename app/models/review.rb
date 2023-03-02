class Review < ActiveRecord::Base
   belongs_to :user
   belongs_to :product

   # puts in the terminal a string formatted as follows: 
   # Review for {insert product name} by {insert user name}: {insert review star_rating}. {insert review comment}
   def print_review
        puts "Review for #{self.product.name} by #{self.user.name}: #{self.star_rating}. #{self.comment}"
    end
end
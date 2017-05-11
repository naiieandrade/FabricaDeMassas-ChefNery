class ReviewVersion < ActiveRecord::Base

  attr_reader :comment, :rating

  def initialize(review)
    @comment = review.comment
    @rating = review.rating
  end

end



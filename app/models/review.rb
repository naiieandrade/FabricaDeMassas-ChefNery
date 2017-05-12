class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :product

	validates_presence_of :rating, :message => "Deve haver alguma nota"

  #attr_accessor :comment, :rating

  #def initialize(comment, rating)
  #  @comment, @rating = comment, rating
  #end

  def save
    ReviewVersion.new self
  end

  def rollback(version)
    @rating, @comment = version.rating, version.comment
  end


end

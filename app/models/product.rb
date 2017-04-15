#GRASP pattern: Creator in line 4

class Product < ActiveRecord::Base
  has_and_belongs_to_many :ingredients
  has_and_belongs_to_many :orders

  enum category: ["Culinária Italiana", "Culinária Oriental", "Culinária Árabe", "Culinária Brasileira"]

  TITLE_MIN_LENGTH = 3
  DESCRIPTION_MIN_LENGTH = 2

  validates :title, presence: true, :length => {:minimum => TITLE_MIN_LENGTH}, uniqueness: true
  validates :description, presence: true, :length => {:minimum => DESCRIPTION_MIN_LENGTH}

  def self.search(search)
  	if search
    	where(["NAME LIKE ?", "%#{search}%"])
    else
    	all
    end
  end


end

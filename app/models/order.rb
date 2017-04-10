class Order < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :products

	validates :shippment_address, presence: true
end

class CartItem < ApplicationRecord
	belongs_to :item
	belongs_to :customer

	validates :customer_id, presence: true
	validates :item_id, presence: true
	validates :quantity, presence: true

	def tax_price
		(item.price.to_i * 1.1).floor
	end

	def sub_price
		self.tax_price * self.quantity
	end

	# def total_money
	# 	CartItem.total_money
	# endzZ

end

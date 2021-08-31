class CartItem < ApplicationRecord


  belongs_to :item
  belongs_to :customer

  #def total_price
	#	line_items.to_a.sum { |item| item.total_price }
	#end

end

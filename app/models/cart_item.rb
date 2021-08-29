class CartItem < ApplicationRecord
  
  
  belongs_to :item
  
  #def total_price
	#	item.price * cart_item.amount
	#end
	
end

class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order


  def item_quantity(cart)
    quantity = cart.contents[item.id.to_s]
  end

  def order_total(cart)
    byebug
    cart.contents[item.id.to_s] * item.price
  end

end

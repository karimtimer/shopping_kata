class Discount

  def initialize(item, num_of_items, discount_value)
    @item = item
    @num_of_items = num_of_items
    @discount_value = discount_value
  end

  def apply_discount(scanned_items)
    (scanned_items.tally.fetch(@item, 0) / @num_of_items) * @discount_value
  end

  #todo: 20% off all items if you have 5 As
  # buy 2 As, get 1 B free
end

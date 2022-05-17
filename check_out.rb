require_relative "discounts/basic_discount.rb"

class CheckOut

  attr_accessor :scanned_items
  
  def initialize(rules, discounts)
    @scanned_items = []
    @rules = rules
    @discounts = discounts
  end

  def scan(item)
    scanned_items << item
  end

  def total
    basket_total = scanned_items.map do |item| 
      @rules.fetch(item.downcase.to_sym, 0)  
    end.sum

    discount_total = @discounts.map do |discount|
      discount.apply_discount(scanned_items)
    end.sum

    basket_total - discount_total
  end
end

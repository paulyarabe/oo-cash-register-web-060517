require 'pry'

class CashRegister
	attr_accessor :total


	def initialize(discount=0)
		@total = 0
		@discount = discount
		@items = []
	end

	def discount
		@discount
	end

	def add_item(title, price, quantity=1)
		@price = price
		@quantity = quantity
		@total = @total + @price * @quantity
		@items << title
		while quantity != 1
			@items << title
			quantity -=1
		end
	end

	def apply_discount
		if discount>0
			@total = @total * ((100-@discount)/100.0)
			"After the discount, the total comes to $#{@total.to_i}."
		else
			"There is no discount to apply."
		end
	end

	def items
		@items
	end

	def void_last_transaction
		self.total = self.total - @price * @quantity
	end

end

new_register = CashRegister.new
new_register.add_item("eggs", 1.99)
new_register.add_item("tomato", 1.76, 3)

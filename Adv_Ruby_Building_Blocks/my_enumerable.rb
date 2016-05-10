#This is the script for the custom Enumerable module I will creates as part of The Odin Project: III Ruby : Basic Ruby : Projects Advanced Building Blocks

module Enumerable

	def my_each
		for item in self
			yield item
		end
	end

	def my_each_with_index
		index = 0
		for item in self
			yield item, index
			index += 1
		end
	end

	def my_select
		query = []
		self.my_each {|item| query << item if yield(item)}
		return query
	end

	def my_all?
		self.my_each do |item|
			unless yield(item)
				return false
			end
		end
		true
	end

	def my_any?
		self.my_each do |item|
			if yield(item)
				return true
			end
		end
		false
	end

	def my_none?
		return !self.my_any?{|item| yield}
	end

	def my_count(args=nil)
		if args
			self.my_select {|item| item == args}.size
		elsif block_given?
			self.my_select {|item| yield(item)}.size
		else
			self.size
		end
	end

	def my_map(proc, &block)
		new_arr = []
		self.my_each do |x|
			if block.nil?
				new_arr << proc.call(x)
			elsif !proc.nil?
				tmp = proc.call(x)
				new_arr <<block.call(tmp)
			end
			new_arr
	end

	def my_inject(initial=nil)
		if initial
			self.my_each {|x| initial = yield(initial, x)}
		else
			self.my_each_with_index do |x, y|
				if y == 0
					initial = self[y]
					next
				end
				initial = yield(initial, x)
			end
		end
		initial
	end

end


def multiply_els(arr)
	arr.my_inject{|start, n| start * n}
end
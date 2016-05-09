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



end
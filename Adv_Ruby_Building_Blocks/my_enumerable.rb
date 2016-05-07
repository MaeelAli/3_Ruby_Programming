#This is the script for the custom Enumerable module I will creates as part of The Odin Project: III Ruby : Basic Ruby : Projects Advanced Building Blocks

module Enumerable

	def my_each
		for index in (0...self.size)
			yield self.to_a[index]
		end
	end

end
def bubble_sort(num_array)
	bubble_sort_by(num_array) {|left,right| left-right}	
end

def bubble_sort_by(arr)
	z = arr
	z.each_index do |i|
		z.each_index do |j|
			if yeild z[i] z[j] > 0
				z[i], z[j] = z[j], z[i]
			end
		end
	end
	z
end

bubble_sort([4,3,78,2,0,2])

bubble_sort_by(["hi","hello","hey"]) do |left,right|
	left.length - right.length
end

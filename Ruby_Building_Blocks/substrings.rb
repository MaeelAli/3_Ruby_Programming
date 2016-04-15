def substrings(string, dictionary)

	#init count of words hash
	total_count = Hash.new(0)

	#for each word in dictonary scan string for word and for each match update count
	dictionary.each do |word| 
		total_count[word.downcase] = 0
		string.downcase.scan(/(#{word.downcase})/) { |match| total_count[match] += 1} 
	end

	p total_count.select { |key,value| value > 0 }
end


dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

substrings("below", dictionary)
puts ""
substrings("Howdy partner, sit down! How's it going?", dictionary)
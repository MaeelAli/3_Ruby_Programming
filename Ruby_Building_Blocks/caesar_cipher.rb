def caesar_cipher (in_str, shift_factor)
	
	#define range of characters to be encrypted
	lower = ('a'..'z').to_a
	upper = lower.join("").upcase.split("")

	#convert input string into array
	letters = in_str.split("")

	#initilize output variable
	payload = []
	
	letters.each do |letter|
		encrypted_text = letter

		# if (a..z) 
		if lower.include?(letter)
			cipher_index = lower.index(letter) + shift_factor
			encrypted_text = (shift_factor > 0) ? lower[cipher_index % 26] : lower[cipher_index]
		
		# else if (A..Z)
		elsif upper.include?(letter)
			cipher_index = upper.index(letter) + shift_factor
			encrypted_text = (shift_factor > 0) ? upper[cipher_index % 26] : upper[cipher_index]
		
		# else don't need to encrypt
		else
			
		end

		#push encrypted character to payload
		payload << encrypted_text
	end
	
	payload = payload.join("")
	puts payload
end

caesar_cipher("What a string!", 5)
caesar_cipher("ABCDEFGHIJKLMNOPQRSTUVWXYZ", -5)
caesar_cipher("ABCDEFGHIJKLMNOPQRSTUVWXYZ", 5)
caesar_cipher("ABCDEFGHIJKLMNOPQRSTUVWXYZ".downcase, -11)
caesar_cipher("ABCDEFGHIJKLMNOPQRSTUVWXYZ".downcase, 25)
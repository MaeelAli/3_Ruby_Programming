def caesar_cipher (in_str, shift_factor)
	
	lower = ('a'..'z').to_a
	upper = lower.join("").upcase.split("")

	letters = in_str.split("")
	payload = []
	letters.each do |letter|
		encrypted_text = letter
		if lower.include?(letter)
			cipher_index = lower.index(letter) + shift_factor
			encrypted_text = (shift_factor > 0) ? lower[cipher_index % 26] : lower[cipher_index]
		elsif upper.include?(letter)
			cipher_index = upper.index(letter) + shift_factor
			encrypted_text = (shift_factor > 0) ? upper[cipher_index % 26] : upper[cipher_index]
		else
			
		end
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
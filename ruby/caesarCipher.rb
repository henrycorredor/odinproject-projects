# Return ciphered letter or the same character in case is not a letter
#
# @param letter [String] Letter to be ciphered
# @param places [Integer] Places to move to the right
# @return [String] Ciphered letter
def get_cipher_letter(letter, places)
  low_case_letters = ("a".."z").to_a
  big_case_letters = ("A".."Z").to_a

  my_index = low_case_letters.index(letter.downcase)
  return letter if my_index.nil?

  to_move = low_case_letters.length - (my_index + places)
  if to_move >= 0
    return low_case_letters[my_index + places] if low_case_letters.include?(letter)
    return big_case_letters[my_index + places] if big_case_letters.include?(letter)
  else
    return low_case_letters[to_move * -1] if low_case_letters.include?(letter)
    return big_case_letters[to_move * -1] if big_case_letters.include?(letter)
  end

  letter
end


def caesar_cipher(to_cipher, places)
  to_cipher.split("").map{|letter| get_cipher_letter(letter, places)}.join("")
end

puts caesar_cipher("What a string!", 5)
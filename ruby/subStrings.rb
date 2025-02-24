# Returns a hash listing each substring (case-insensitive) that was found in the original string and how many times it was found
# @param words [String] The word to analyze
# @param dictionary [Array<String>] Words dictionary
# @return [Hash<String, Integer>] Association of words / coincidences number
def substrings(words, dictionary)
  out = Hash.new

  words.split(" ").map do |word|
    dictionary.select { |dictionary_word| word.downcase.include?(dictionary_word) }.each do |matched_word|
      out[matched_word] = out[matched_word].nil? ? 1 : out[matched_word] + 1
    end
  end

  out
end

my_dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]

puts substrings('below', my_dictionary)
puts substrings("Howdy partner, sit down! How's it going?", my_dictionary)

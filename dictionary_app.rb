require 'unirest'

looking_up_words = true

while looking_up_words

  system "clear"
  puts "All the words brought to you by Maria"
  puts
  print "Enter a word: "
  input_word = gets.chomp
  puts

  definitions_response = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{input_word}/definitions?limit=10&includeRelated=true&useCanonical=false&includeTags=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")
  definitions = definitions_response.body

  puts "DEFINITIONS"
  puts "-" * 40
  definitions.each.with_index do |definition, index|
    puts "#{index + 1}. #{definition["text"]}"
    puts
  end

  puts
  puts

  top_example_response = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{input_word}/topExample?useCanonical=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5
  ")
  top_example = top_example_response.body

  puts "TOP EXAMPLE"
  puts "-" * 40
  puts top_example["text"]

  puts
  puts

  pronunciations_response = Unirest.get("http://api.wordnik.com:80/v4/word.json/cow/pronunciations?useCanonical=false&limit=50&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5
  ")
  pronunciations = pronunciations_response.body

  puts "PRONOUNCIATIONS"
  puts "-" * 40
  first_pronunciation = pronunciations[0]
  if first_pronunciation
    puts first_pronunciation["raw"]
  end
  # pronunciations.each do |pronunciation|
  #   puts pronunciation["raw"]
  # end

  puts "Press Enter to look up another word, otherwise press q to exit"
  user_input = gets.chomp

  if user_input == "q"
    looking_up_words = false
  end
end

system "clear"
puts "Thanks for looking up words with me."










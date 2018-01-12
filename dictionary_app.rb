require 'unirest'

system "clear"
puts "All the words brought to you by Maria"
puts 

print "Enter a word:"
word = gets.chomp
puts

definitions_response = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{word}/definitions?limit=10&includeRelated=true&useCanonical=false&includeTags=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")

definitions = definitions_response.body

puts "DEFINITIONS"

definitions.each.with_index do |definition, index|
  puts "#{index + 1}. #{definition["text"]}"
  puts 
end 

top_examples_response = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{word}/topExample?useCanonical=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")

top_example = top_examples_response.body 

puts "TOP EXAMPLE"
puts top_example["text"]
puts

pronunciations_response = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{word}/pronunciations?useCanonical=false&limit=10&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")

pronunciations = pronunciations_response.body 

puts "PRONUNCIATIONS"
pronunciations.each do |pronunciation|
  puts pronunciation["raw"]
end










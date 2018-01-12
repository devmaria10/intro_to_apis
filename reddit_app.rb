require 'unirest'

system "clear"

response = Unirest.get("https://www.reddit.com/r/programming/.json")

article = 
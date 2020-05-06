# Place holders for Yelp Fusion's API key. Grab it
# from https://www.yelp.com/developers/v3/manage_app



class Computer

  attr_accessor  :computer_type

  @@all = []

  def initialize(computer_type)
    @computer_type = computer_type
    @@all << self
  end

  def self.all
    @@all
  end

  def self.print_all_computers
    self.all.each_with_index do |computer, idx|
        puts "<<< Computer ##{idx + 1} >>>"
        puts computer.computer_type
        puts "----------------------"
    end
  end


end







































# require 'httparty'

#  class APIAdapter
 
  

#   API_KEY = "R8iDmJsEDpy34vBrcKdeaeRih7-SVyLhGSpGdro_6hvz1GpFf5WknBOumWNZeVC5Azw5pbPHS2RQ79hbhB2UZq42juL-hCnSkV2jTqjLyhQP6RZ0DG3iU5VxOlSwXnYx"

#     # Constants, do not change these
#     API_HOST = "https://api.yelp.com"
#     SEARCH_PATH = "/v3/businesses/search"

#     DEFAULT_TERM = "pizza"
#     DEFAULT_LOCATION = "Austin, TX"
#     SEARCH_LIMIT = 10

#     def search(term, location)
#       url = "#{API_HOST}#{SEARCH_PATH}"
#       params = {
#         term: term,
#         location: location,
#         limit: SEARCH_LIMIT
#       }
    
#       response = HTTP.auth("Bearer #{API_KEY}").get(url, params: params)
#       binding.pry
#       response.parse
#     end
  



  
#   end

#   APIAdapter.new.search("pizza", "Austin")



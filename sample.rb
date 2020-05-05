require "json"  
require "nokogiri"
require "http"  
require "optparse"  


# Place holders for Yelp Fusion's API key. Grab it
# from https://www.yelp.com/developers/v3/manage_app
API_KEY = "R8iDmJsEDpy34vBrcKdeaeRih7-SVyLhGSpGdro_6hvz1GpFf5WknBOumWNZeVC5Azw5pbPHS2RQ79hbhB2UZq42juL-hCnSkV2jTqjLyhQP6RZ0DG3iU5VxOlSwXnYx"



# Constants, do not change these
API_HOST = "https://api.yelp.com"
SEARCH_PATH = "/v3/businesses/search"

DEFAULT_TERM = "pizza"
DEFAULT_LOCATION = "Austin, TX"
SEARCH_LIMIT = 5



# class Finder
#   attr_accessor :name, :opts, :term, :location
  

#   def initialize(name, opts, term, location)
#     @name = name
#     @opts = opts
#     @term = term
#     @location = location

#   end

  # source:https://www.yelp.com/developers/documentation/v3/business_search 
  def search(term, location)# Make a request to the Fusion search endpoint.
    url = "#{API_HOST}#{SEARCH_PATH}"
    params = {
      term: term,
      location: location,
      limit: SEARCH_LIMIT
    }
    response = HTTP.auth("Bearer #{API_KEY}").get(url, params: params)
    response.parse
  end
# end


# class Options

  #  source:https://rotati.com/blog/using-the-optionparser-ruby-standard-library-module
  #          https://readysteadycode.com/howto-parse-command-line-options-with-ruby-optparse


  # attr_accessor :name, :opts, :term, :location
  

  #   def initialize(name, opts, term, location)
  #     @name = name
  #     @opts = opts
  #     @term = term
  #     @location = location

  #   end

  options = {}
  OptionParser.new do |opts|  # accepts a variety of options that can be passed in to alter the behaviour of the application
      opts.on("-tTERM", "--term=TERM", "Search term (for search)") do |term|
      options[:term] = term
    end

    opts.on("-lLOCATION", "--location=LOCATION", "Search location (for search)") do |location|
      options[:location] = location
    end
  end.parse!

  command = ARGV  #ARGV is the product of OptionParser

# end 


# class Output

#   attr_accessor :name
#   attr_reader :term, :location
#   # attr_writer 
#     def initialize(name, term, location)
#       @name = name
#       @term = term
#       @location = location
#     end

  case command.first
    when "search"
      term = options.fetch(:term, DEFAULT_TERM)
      location = options.fetch(:location, DEFAULT_LOCATION)

      response = search(term, location)

      puts "Found #{response["total"]} businesses. Listing #{SEARCH_LIMIT}:"
      response["businesses"].each {|biz| puts biz["name"]}

    else
      puts "Please specify a command: search or lookup"
  end
  
# end
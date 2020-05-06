require 'nokogiri'
require 'open-uri'
require 'pry'
  
      # base_url = "https://www.newegg.com/All-in-One-Computers/SubCategory/ID-3309?Tid=167567"
      # html_to_elements = open(base_url)
      # parsed_html_elements = Nokogiri::HTML(html_to_elements)
      # review_elements = parsed_html_elements.css('.item-title')
      # review_elements.map do |
      # comp_name = review_elements[0].text.split(',')[0] 
      # # puts "First Computer Name:" + comp_name


    class Scraper

      def self.scrape
      base_url = "https://www.newegg.com/All-in-One-Computers/SubCategory/ID-3309?Tid=167567"
      html_to_elements = open(base_url)
      parsed_html_elements = Nokogiri::HTML(html_to_elements)
      review_elements = parsed_html_elements.css('.item-container')
      review_elements.each do |element|
        computer_type = element.css("a.item-title").children[0]
      # computer_type.each do |element|
      Computer.new(computer_type)
      # Computer.new(comp_name)
             end
      end
  end


 

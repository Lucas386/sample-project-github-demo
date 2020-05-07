  
require 'nokogiri'
require 'open-uri'
require 'pry'
  


    class Scraper

      def self.scrape
        base_url = "https://www.newegg.com/Gaming-Desktops/SubCategory/ID-3742?Tid=897449"
        html_to_elements = open(base_url)
        parsed_html_elements = Nokogiri::HTML(html_to_elements)
        review_elements = parsed_html_elements.css('.item-container')
        review_elements.each do |element|
          computer_type = element.css("a.item-title").children[0]
          computer_price = element.css("li.price-current").css("strong").text
          Computer.new(computer_type, computer_price)
       
             end
      end

   






  end


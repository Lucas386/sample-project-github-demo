#Cli controller

class Cli 

    attr_accessor :operator_name 

    def greeting
        puts "Hello computer!"
        puts ""
        puts "What's your name?"
    end

    def get_operator_name
        name = gets.strip
        self.operator_name = name
        puts ""
        puts "Welcome, #{self.operator_name}"
    end

    def first_scrape
        puts ""
        puts ""
        puts "We're about to start scraping....."
        puts "This could take a while"
        Scraper.scrape
    end

    # def menu
    #     puts ""
    #     computer_choice = Computer.find_by_index 
    #     info = gets.strip
        

    # end

    def run 
        greeting
        get_operator_name
        first_scrape
        Computer.print_all_computers
    end
end 
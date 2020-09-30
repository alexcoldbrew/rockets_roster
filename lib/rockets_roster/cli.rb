class RocketsRoster::CLI

    def call
        welcome
        Scraper.scrape_players
        list_players
        puts ""
        menu
        puts ""
    end

    def welcome
        puts ""
        puts "Here is the current roster for the Houston Rockets!"
        puts ""
    end

    def goodbye
        puts "Thanks for using! Go Rockets!!"
    end

    def list_players
        RocketsRoster::Player.all.each.with_index(1) do |player, i|  
            puts "#{i}. #{player.name}"
        end
    end

    def menu
        input = nil
        while input != "exit"
            puts ""
            puts "Choose the menu number for the player you'd like to know more about, type 'list' to display roster again, or type 'exit' to end:"
            puts ""

            input = gets.strip.downcase

            puts ""
            if input.to_i.between?(1, 18)
                the_player = RocketsRoster::Player.all[input.to_i - 1]
                puts "Name: #{the_player.name}, Position: #{the_player.position}, Height: #{the_player.height}in, Weight: #{the_player.weight}lbs"
                puts ""
            elsif input == 'list'
                list_players
            elsif input =='exit'
                goodbye
            else
                puts "Not sure what you want, type 'list' or 'exit'."
            end
        end
    end

end

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
        puts "         ,_                                                  _.
        <  ``--.                                        ..-`` |
         |      ||``--.. ____               __  __..--i|      |
         |  |\  ||  ,.  ||   ```||``||``||`` _||_   __||  ||  |
         |  |,| ||  ||  ||  ||__||  ||  ||  |___ |  |  |  | `-`
        <      < |  ||  ||  | __ |     < |  ____||  |  `. `--.
         |  || `.|  ||  ||  ||  ||  ||  ||  |    |  |    `-.  |
         |  ||  ||  ``  ||  ``  ||  ||  ||  ````||  |  |``||  |
         |  ||  ||__..--``---`````--``--````----``..|_ |  ``  |
         |  | \/                                      ``--.__ |
          \/                                                 ``".colorize(:red)
        puts ""
        puts "Here is the current roster for the Houston Rockets!"
        puts ""
    end

    def goodbye
        puts "Thanks for using! Go Rockets!!"
    end

    def list_players
        RocketsRoster::Player.all.each.with_index(1) do |player, i|  
            puts "#{i}".colorize(:red) + ". #{player.name}"
        end
    end

    def menu
        input = nil
        while input != "exit"
            puts ""
            puts "Choose the menu number for the player you'd like to know more about, type " + "'list'".colorize(:light_blue) + " to display roster again, or type " + "'exit'".colorize(:light_blue) + " to end:"
            puts ""

            input = gets.strip.downcase

            puts ""
            if input.to_i.between?(1, 18)
                the_player = RocketsRoster::Player.all[input.to_i - 1]
                puts "Name: ".colorize(:red) + "#{the_player.name}, " + "Position: ".colorize(:red) + "#{the_player.position}, " + "Height: ".colorize(:red) + "#{the_player.height}in, " + "Weight: ".colorize(:red) + "#{the_player.weight}lbs"
                puts ""
            elsif input == 'list'
                list_players
            elsif input =='exit'
                goodbye
            else
                puts "Not sure what you want, type " + "'list'".colorize(:light_blue) + " or " + "'exit'".colorize(:light_blue) + " ."
            end
        end
    end

end

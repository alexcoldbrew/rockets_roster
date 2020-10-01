class RocketsRoster::CLI

    # made the call method that runs simple by splitting it up into other methods
    def call
        welcome
        Scraper.scrape_players
        list_players
        menu
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
        puts "-----------------------------------------------------------------"
        puts ""
        puts "Here is the current roster for the Houston Rockets!"
        puts ""
    end

    def goodbye
        puts "-----------------------------------------------------------------"
        puts ""
        puts "Thanks for using! Go Rockets!!".colorize(:red)
        puts ""
        puts "-----------------------------------------------------------------"
        puts ""
    end

    def list_players
        puts "-----------------------------------------------------------------"
        puts ""
        # takes all instances of players and interates thru them to return both a menu number and each player, separately
        RocketsRoster::Player.all.each.with_index(1) do |player, i|  
            puts "#{i}".colorize(:red) + ". #{player.name}"
        end
        puts ""
        puts "-----------------------------------------------------------------"
    end

    def menu
        input = nil
        while input != "exit"
            puts ""
            puts "Choose the menu number for the player you'd like to know more about, type " + "'list'".colorize(:light_blue) + " to display roster again, or type " + "'exit'".colorize(:light_blue) + " to end:"
            puts ""

            input = gets.strip.downcase

            puts ""
            # only inputs between 1 and 18 (all menu choices) are valid
            if input.to_i.between?(1, 18)
                # local variable to store instances of players at specific index we're on
                the_player = RocketsRoster::Player.all[input.to_i - 1]
                # calls on each player's attribute to display its info (only works because we have many player instances, rather than a roster instance with many players)
                puts "Name: ".colorize(:red) + "#{the_player.name}, " + "Position: ".colorize(:red) + "#{the_player.position}, " + "Height: ".colorize(:red) + "#{the_player.height}in, " + "Weight: ".colorize(:red) + "#{the_player.weight}lbs"
                puts ""
            elsif input == 'list'
                list_players
            # created this elsif to cleanly exit the program, may be able to refactor my while statement?
            elsif input =='exit'
                goodbye
            # creating a better UX by reenforcing what user should input to get a result
            else
                puts "Not sure what you want, type " + "'list'".colorize(:light_blue) + " or " + "'exit'".colorize(:light_blue) + " ."
            end
        end
    end

end

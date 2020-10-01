class Scraper

    def self.scrape_players
        # using Nokogiri to access the website to scrape, set to a local variable that I can access
        doc = Nokogiri::HTML.parse(open("https://www.basketball-reference.com/teams/HOU/2020.html"))

        # set up a counter to scrape/initialize only the first 18 instances of a player, not duplicate info, since there are 18 players on the roster
        i = 0
        while i < 18
            # am now creating many player objects, rather than one roster object containing their info
            player = RocketsRoster::Player.new
            
            # sets specific scraped data to the player variable attributes that we are accessing and storing in the Player class to call on in the CLI controller
            player.name = doc.search("tr td[data-stat=player]")[i].text
            player.position = doc.search("tr td[data-stat=pos]")[i].text
            player.height = doc.search("tr td[data-stat=height]")[i].text
            player.weight = doc.search("tr td[data-stat=weight]")[i].text

            # increment the counter on every loop to create/pass thru each new player and their data
            i += 1
        end
    end

end
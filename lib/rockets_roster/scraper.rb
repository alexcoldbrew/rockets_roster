class Scraper

    def self.scrape_players
        doc = Nokogiri::HTML.parse(open("https://www.basketball-reference.com/teams/HOU/2020.html"))
        
        i = 0
        while i < 18
            # am now creating many player objects, rather than one roster object containing their info
            player = RocketsRoster::Player.new
            
            player.name = doc.search("tr td[data-stat=player]")[i].text
            player.position = doc.search("tr td[data-stat=pos]")[i].text
            player.height = doc.search("tr td[data-stat=height]")[i].text
            player.weight = doc.search("tr td[data-stat=weight]")[i].text
            i += 1
        end
        #binding.pry
    end

end
require 'pry'

class RocketsRoster::Player

    attr_accessor :name, :position, :height, :weight
   
    def self.all
        players = []
        #scrape site and return players based on that data
        players << self.scrape_players
        
        players
    end

    def self.scrape_players
        doc = Nokogiri::HTML.parse(open("https://www.basketball-reference.com/teams/HOU/2020.html"))
        
        player = self.new
        # had to slice the fist 18 indexes returned due to there being duplicates after and .uniq not working.
        player.name = doc.search("tr td[data-stat=player]").map(&:text).slice(0, 18)
        player.position = doc.search("tr td[data-stat=pos]").map(&:text)
        player.height = doc.search("tr td[data-stat=height]").map(&:text)
        player.weight = doc.search("tr td[data-stat=weight]").map(&:text)

        player
    end

end
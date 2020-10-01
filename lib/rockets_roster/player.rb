class RocketsRoster::Player

    # reader and writers for all player info, don't need to initialize with them since they are being set by the scraper at instanciation
    attr_accessor :name, :position, :height, :weight

    # pretty typical pattern for creating and storing instances of many things, players in this case
    @@all = []
   
    # adds each player to our empty array so that we can access them in the cli controller
    def initialize
        @@all << self
    end

    # returns all player instances
    def self.all
        @@all
    end

end
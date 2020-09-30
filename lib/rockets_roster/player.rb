require 'pry'

class RocketsRoster::Player

    attr_accessor :name, :position, :height, :weight

    @@all = []
   
    def initialize
        @@all << self
    end

    def self.all
        @@all
    end


end
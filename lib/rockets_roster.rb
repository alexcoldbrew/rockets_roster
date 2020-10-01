require 'nokogiri'
require 'open-uri'
require 'pry'

require 'colorize' # - Extends String class
require 'colorized_string' # - add ColorizedString class


require_relative "rockets_roster/version"

require_relative "rockets_roster/player"
require_relative "rockets_roster/cli"
require_relative "rockets_roster/scraper"
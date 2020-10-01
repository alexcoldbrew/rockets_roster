# this file is just requiring all of our various files and gems so that every other file can access them without 'require'-ing at the top of every file

require 'nokogiri'
require 'open-uri'
require 'pry'

require 'colorize' # - Extends String class
require 'colorized_string' # - add ColorizedString class


require_relative "rockets_roster/version"

require_relative "rockets_roster/player"
require_relative "rockets_roster/cli"
require_relative "rockets_roster/scraper"
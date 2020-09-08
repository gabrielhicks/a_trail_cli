require 'pry'
require 'tty-prompt'
require 'colorize'
require 'tty-box'

class Character < ActiveRecord::Base
    has_many :stories
    has_many :bios
end
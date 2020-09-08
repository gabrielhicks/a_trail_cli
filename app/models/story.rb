require 'pry'
require 'tty-prompt'
require 'colorize'
require 'tty-box'

class Story < ActiveRecord::Base
    belongs_to :character
    has_many :user_stories
    has_many :users, through: :user_stories

    def first_story
    end

    def second_story
    end

    def third_story
    end
    
end
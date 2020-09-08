require 'pry'
require 'tty-prompt'
require 'colorize'
require 'tty-box'

class Bio < ActiveRecord::Base
    belongs_to :character
    has_many :user_bios
    has_many :users, through: :user_bios

    def bio_menu
        prompt = TTY::Prompt.new
        player_selection = prompt.select("What would you like to do?".colorize(:light_yellow)) do |menu|
            menu.choice name: "Character Information", value: 1
            menu.choice name: "Story Mode", value: 2
            menu.choice name: "Exit", value: 3
        end
        if player_selection == 1
            self.readme
        elsif player_selection == 2
            UserStory.create(user_id: Bio.first.user_bios.last.user.id, room_id: Story.first.id)
            Story.first_story
        else player_selection == 3
            CLI.start_game
        end
    end

    def readme

    end

end
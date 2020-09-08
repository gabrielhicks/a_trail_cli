require 'pry'
require 'tty-prompt'
require 'colorize'
require 'tty-box'

class User < ActiveRecord::Base
    has_many :user_skills
    has_one :skill, through: :user_skills
    has_many :user_bios
    has_one :bio, through: :user_bios
    has_many :user_stories
    has_one :story, through: :user_stories

    def self.login
        system("clear")
        prompt = TTY::Prompt.new
        name = prompt.ask("Please enter your username")
        password = prompt.mask("Please enter your password")
        User.find_or_create_by(username: name, password: password)
    end

    def create_skills
        if self.user_skills.empty? 
            UserSkill.create(user: self, skill: Skill.create)
        end
    end

    def start_game
        system("clear")
        prompt = TTY::Prompt.new
        selection = prompt.select("Welcome, to the 'A Trail' game! Please select an option:") do |menu|
            menu.choice name: "Start Game".colorize(:green), value: 1
            menu.choice name: "Quit".colorize(:red), value: 2
        end
        if selection == 2
            box = TTY::Box.frame(width: 30, height: 8, align: :center, border: :thick, padding: 2) do "Thanks for playing, it has been great to get to know you!" end
                sleep(3)
                exit!
        else selection == 1
            return true
        end
    end
end
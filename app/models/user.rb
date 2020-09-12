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

    def self.create_user
        prompt = TTY::Prompt.new
        name = prompt.ask("Please create a username")
        if User.find_by(username: name) == nil
            prompt = TTY::Prompt.new
            password = prompt.mask("Please create a password")
            full_name = prompt.ask("Please enter your first and last name")
            return User.find_or_create_by(username: name, password: password, first_name: full_name.split(" ").first, last_name: full_name.split(" ").last)
        else
            box = TTY::Box.warn("It appears this username has already been taken")
            print box
            sleep(3)
            User.create_user
        end
    end

    def self.existing_user
        prompt = TTY::Prompt.new
        name = prompt.ask("Please enter your username")
        password = prompt.mask("Please enter your password")
        if User.find_by(username: name, password: password) == nil
            box = TTY::Box.warn("Invalid Username/Password combonation, please try again.")
            print box
            sleep(3)
            User.existing_user
        else
        return User.find_by(username: name, password: password)
        end
    end


    def create_skills
        if self.user_skills.empty? 
            UserSkill.create(user: self, skill: Skill.create)
        end
    end

    def choose_char
        choose_char = prompt.select("Please choose a character to play:") do |menu|
        menu.choice name: "Gabriel Hicks", value: 1
        end
        if choose_char == 1
            system("clear")
            UserStory.find_or_create_by(user_id: user.id, story_id: Story.first.id)
            box = TTY::Box.frame(width: 30, height: 8, align: :center, border: :thick, padding: 2) do "Enjoy your new life as Gabriel Hicks" end
            Bio.first.menu
        end
    end
end
require 'pry'
require 'tty-prompt'
require 'colorize'
require 'tty-box'
class CLI
    def self.main_screen
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

    def start
        prompt = TTY::Prompt.new
        box = TTY::Box.frame(width: 30, height: 8, align: :center, border: :thick, padding: 2) do "Welcome to A Trail, a tale of misadventure!" end
        sleep (2)
        user = User.login
        user.create_skills
        user.start_game
        choose_char = prompt.select("Please choose a character to play:") do |menu|
            menu.choice name: "Gabriel Hicks", value: 1
            end
        if house_selection == 1
            UserStory.find_or_create_by(user_id: user.id, story_id: Story.first.id)
            box = TTY::Box.frame(width: 30, height: 8, align: :center, border: :thick, padding: 2) do "Enjoy your new life as Gabriel Hicks" end
            Bio.first.menu
        end
    end
end
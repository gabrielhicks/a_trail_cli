require 'pry'
require 'tty-prompt'
require 'colorize'
require 'tty-box'
class CLI

    def welcome_screen
        box = TTY::Box.frame(width: 30, height: 8, align: :center, border: :thick, padding: 2) do "Welcome to A Trail, a tale of misadventure!" 
        end
        puts box
        sleep (2)
    end

    def start_game
        system("clear")
        prompt = TTY::Prompt.new
        selection = prompt.select("Welcome, to the 'A Trail' game! Please select an option:") do |menu|
            menu.choice name: "Start Game".colorize(:green), value: 1
            menu.choice name: "Quit".colorize(:red), value: 2
        end
        if selection == 2
            box = TTY::Box.frame(width: 30, height: 8, align: :center, border: :thick, padding: 2) do "Thanks for playing, it has been great to get to know you!" 
            end
            puts box
            sleep(3)
            exit
        else selection == 1
            return true
        end
    end

    def start
        system("clear")
        self.welcome_screen
        @user = self.login
        self.start_game
        user.create_skills
        User.choose_char
    end

    def login
        prompt = TTY::Prompt.new
            selection = prompt.select("Hello! Please sign up, or sign in:") do |menu|
                menu.choice name: "New User".colorize(:green), value: 1
                menu.choice name: "Existing User".colorize(:green), value: 2
                menu.choice name: "Exit".colorize(:red), value: 3
            end
                if selection == 1
                    @user = User.create_user
                elsif selection == 2
                    @user = User.existing_user
                elsif selection == 3
                    exit
                end
    end
end
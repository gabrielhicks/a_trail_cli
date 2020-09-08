require 'pry'
require 'tty-prompt'
require 'colorize'
require 'tty-box'

class Skill < ActiveRecord::Base
    has_many :user_skills
    has_many :users, through: :user_skills
end
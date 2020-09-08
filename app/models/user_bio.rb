class UserBio < ActiveRecord::Base
    belongs_to :user
    belongs_to :bio
end
class Opponent <ActiveRecord::Base
    has_many :scoreboards
    has_many :users, through: :scoreboards
end
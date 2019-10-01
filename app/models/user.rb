class User <ActiveRecord::Base
    has_many :scoreboards
    has_many :opponents, through: :scoreboards
end
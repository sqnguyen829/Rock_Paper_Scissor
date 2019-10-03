class User <ActiveRecord::Base
    has_many :scoreboards
    has_many :statuses, through: :scoreboards
end
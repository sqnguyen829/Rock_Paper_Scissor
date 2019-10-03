require 'bundler/setup'
Bundler.require

#db connection
ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: "db/development.sqlite"
)

require_all 'app'
require_all 'lib'
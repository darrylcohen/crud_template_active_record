require 'active_record'

options = {
  adapter: 'postgresql',
  database: 'names_db'
}
ActiveRecord::Base.establish_connection(options)

# Load the Rails application.
require_relative 'application'

database_connection_file = File.join(Rails.root, 'database_connection.env')
load(database_connection_file) if File.exist?(database_connection_file)

# Initialize the Rails application.
Rails.application.initialize!

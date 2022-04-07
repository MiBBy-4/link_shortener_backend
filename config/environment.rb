# Load the Rails application.
require_relative 'application'

database_connection_file = File.join(Rails.root, 'database_connection.env')
links_file = File.join(Rails.root, 'links.env')
load(database_connection_file) if File.exist?(database_connection_file)
load(links_file) if File.exist?(links_file)
# Initialize the Rails application.
Rails.application.initialize!

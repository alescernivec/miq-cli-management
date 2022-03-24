require 'optparse'
require 'manageiq-api-client'
require "json"

# Create MIQ client
#
# @param url URL to the ManageIQ instance
# @param username username
# @param password password

def create_client(url, username, password)
  miq = ManageIQ::API::Client.new(
    :url      => url,
    :user     => username,
    :password => password
  )
  miq
end

# Assign or unassign a feature to a role
#
# @param miq_client client instance
# @param role_name role name
# @param feature_name feature name
# @param action Can be "assign" or "unassign"

def assign_feature_to_role(miq_client, role_name, feature_name, action = "assign")
  role_id = miq_client.roles.where(:name => role_name).first["id"]
  string_hash = { "action" => action, "resource" =>  { "identifier" => feature_name } }
  miq_client.connection.post "roles/#{role_id}/features"  do string_hash  end
end

options = {}
option_parser =  OptionParser.new do |opt|
  opt.banner = "Usage: #{$0} --username username --password password --url url --action create_role [arguments]"
  opt.on('-u', '--username USERNAME', '[Mandatory] ManageIQ username') { |o| options[:username] = o }
  opt.on('-p','--password PASSWORD', '[Mandatory] ManageIQ password') { |o| options[:password] = o }
  opt.on('--url URL', '[Mandatory] URL to the ManageIQ API') { |o| options[:url] = o }
  opt.on('-a', '--action ACTION', '[Mandatory] Action to take') { |o| options[:action] = o }
  opt.on('-r', '--role ROLE') { |o| options[:role] = o }
  opt.on('-f', '--feature FEATURE') { |o| options[:feature] = o }
end

option_parser.parse!

if options[:username].nil? || options[:password].nil? || options[:url].nil? || options[:action].nil?
  puts option_parser.help
  exit 1
end

puts options
miq_client=create_client(options[:url], options[:username], options[:password])

ARGV.each do|f|
  if options[:action] == "list_role"
    puts "Listing role: #{f}"
    role = miq_client.roles.where(:name => f).first
  end

  if options[:action] == "assign_feature"
    puts "Assigning a feature  #{f} to a role #{options[:role]}"
    assign_feature_to_role(miq_client,options[:role], f )
  end

  if options[:action] == "create_role"
    puts "Creating role #{f}"
  end

  if options[:action] == "unassign_feature"
    puts "Unassigning feature #{f} from role #{options[:role]}."
    assign_feature_to_role(miq_client,options[:role], f, "unassign" )
  end

end
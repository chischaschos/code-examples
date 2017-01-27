#!/usr/bin/env ruby
# db_cli app env          connects to app with env
# db_cli --apps           lists apps
# db_cli app --envs       shows envs for app
#

apps = Dir['../*'].map { |d| File.realpath(d) }

l_app = ARGV[0]
l_env = ARGV[1]

app = apps.find { |a| a =~ /#{l_app}/ }

unless app
  puts "# #{l_app} not found in :\n #{apps.join("\n")}"
  exit 0
end

require 'yaml'

db_file = File.join(app, 'config/database.yml')

unless File.exist?(db_file)
  puts "Could not find #{db_file}"
  exit 0
end

yaml_content = File.readlines(db_file)
yaml = YAML.load(yaml_content.join)

env = yaml[l_env]

unless env
  puts "# Environment \"#{env}\" not found in: #{yaml.keys.join("\n")}"
  exit 0
end

password = env['password']
username = env['username']
database = env['database']
host = env['host']

exec({ 'PGPASSWORD' =>  password }, "psql --host #{host} --dbname #{database} --username #{username}")

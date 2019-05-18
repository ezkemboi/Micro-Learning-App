ENV['APP_ENV'] ||= "development"
ENV['RAKE_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['APP_ENV'])

# Set up database connection
configure :production, :development do
    db = URI.parse(ENV['DATABASE_URL'] || 'postgresql://localhost/microlearningdb') 
    ActiveRecord::Base.establish_connection(
        :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
        :host => db.host,
        :username => db.user,
        :password => db.password,
        :database => db.path[1..-1],
        :encoding => 'utf8'
    )
end

require 'dotenv/load'

require_all 'app'

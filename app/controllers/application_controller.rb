class ApplicationController < Sinatra::Base
    # use Rack::Session::Cookie
    # use Rack::Session::Pool
    # Enable session usage
    enable :sessions
    set :session_secret, "This is very secret"

    configure do
        set :views, "app/views"
        set :public_dir, "public"
    end

    def protected!
        unless session.has_key?("user_id")
            @error = "Login to access this page"
            redirect '/login'
        end
    end

    # Index page of the app
    get '/' do
        erb :index
    end

end

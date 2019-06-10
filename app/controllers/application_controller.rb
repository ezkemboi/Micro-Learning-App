class ApplicationController < Sinatra::Base
    # use Rack::Session::Cookie
    # use Rack::Session::Pool
    # Enable session usage
    enable :sessions
    configure do
        set :views, "app/views"
        set :public_dir, "public"
    end

    # Protect the endpoints
    def protected!
        unless logged_in
            redirect '/'
        end
    end

    # Check if user is logged in or not logged in
    def logged_in
        if session[:user_id]
            return true
        end
    end

    # Index page of the app
    get '/' do
        erb :index
    end

end

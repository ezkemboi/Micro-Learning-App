class ApplicationController < Sinatra::Base
    configure do
        set :views, "app/views"
        set :public_dir, "public"
    end

    # Index page of the app
    get '/' do
        erb :index
    end

end

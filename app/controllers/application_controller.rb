class ApplicationController < Sinatra::Base
    configure do
        set :views, "app/views"
        set :public_dir, "public"
    end

    # Index page of the app
    get '/' do
        erb :index
    end

    # Dashboard Page where logged user can view article page
    get '/dashboard' do
        erb :dashboard
    end
end

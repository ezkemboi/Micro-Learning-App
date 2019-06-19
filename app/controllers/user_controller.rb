require_relative '../models/user'

class UserController < ApplicationController

    # Post method for registration
    post '/register_user' do
       @user = User.new

       # get user information
       @user.name = params[:name]
       @user.email = params[:email]
       @user.password = params[:password]
       @user.save
       # Redirect user to homepage after successful registration
       redirect "/login"
    end
    
    # Login method, get login and login user to the system

    get '/login' do
        erb :login
    end 

    post '/login_user' do
        @user = User.find_by(:email => params[:email])
        if @user && @user.authenticate(params[:password])
            # Session then redirect
            session[:user_id] = @user.id
            redirect '/dashboard'
        else
            redirect '/'
        end
    end

    get '/logout' do
        session.clear
        redirect '/login'
    end
end

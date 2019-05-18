require_relative '../models/user'

class UserController < ApplicationController
    # Get register page
    get '/register' do
        erb :register
    end

    # Post method for registration
    post '/register_user' do
       @user = User.new

       # get user information
       @user.name = params[:name]
       @user.email = params[:email]
       @user.password = params[:password]
       @user.save

       # Redirect user to homepage after successful registration
       redirect "/dashboard"
    end
end

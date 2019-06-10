require 'sinatra'
require 'httparty'
require_relative '../models/user'

class ArticleController < ApplicationController
    # Dashboard where user can get and read articles
    get '/dashboard' do
        print('---this is not showing----', session[:user_id])
        erb :dashboard
    end 

    post '/article' do
        @searchquery = params[:searchtopic]
        response = HTTParty.get("https://newsapi.org/v2/everything?q=#{@searchquery}&sortBy=popularity&apiKey=7d7ae8a4204e4f45a19286e25674eca1")
        
        # Take the first article
        @article = response["articles"][0]
        if @article
            @title = @article['title']
            @description = @article['description']
            @content = @article['content']
            @author = @article['author']
            @publisheddate = @article['publishedAt']
            @url = @article['url']
            erb :dashboard
        else
            # Return Oops message
            redirect '/'
        end
    end
end

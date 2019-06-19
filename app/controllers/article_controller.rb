require 'sinatra'
require 'httparty'
require_relative '../models/user'

class ArticleController < ApplicationController
    # Dashboard where user can get and read articles
    get '/dashboard' do
        # Check if there is an article that is less than 24 hrs old
        protected!
        @currenttime = Time.new
        @articles = Article.where({user_id: session["user_id"],created_at: (@currenttime - 1.day)..@currenttime})
        # Always take the first one, 
        # although this might not happen as no article will be searched if article exists.
        if @articles.length > 0
            @disable = true
            @article = @articles[0];
            @title = @article.title
            @content = @article.content
            @author = @article.author
            @publisheddate = @article.publisheddate
            @url = @article.url
        else
            @disable = false
        end
        erb :dashboard
    end 

    post '/article' do
        protected!
        # If dashboard shows an article disable search for article
        @newArticle = Article.new

        @searchquery = params[:searchtopic]
        response = HTTParty.get("https://newsapi.org/v2/everything?q=#{@searchquery}&sortBy=popularity&apiKey=7d7ae8a4204e4f45a19286e25674eca1")
        
        # Take the first article
        @article = response["articles"][0]
        if @article
            @newArticle.title = @article['title']
            @newArticle.content = @article['content']
            @newArticle.author = @article['author']
            @newArticle.publisheddate = @article['publishedAt']
            @newArticle.url = @article['url']
            @newArticle.user_id = session["user_id"]
            @newArticle.save
            redirect '/dashboard'
        else
            # Return Oops message
            redirect '/'
        end
    end
end

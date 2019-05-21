require 'httparty'

class ArticleController < ApplicationController
    # Dashboard where user can get and read articles
    get '/dashboard' do
        erb :dashboard
    end 

    post '/article' do
        @searchquery = params[:searchtopic]
        response = HTTParty.get("https://newsapi.org/v2/everything?q=#{@searchquery}&sortBy=popularity&apiKey=7d7ae8a4204e4f45a19286e25674eca1")
        
        # Take the first article
        @article = response["articles"][0]
        if @article
            @description = @article['description']
            erb :dashboard
        else
            # Return Oops message
            redirect '/'
        end
    end
end

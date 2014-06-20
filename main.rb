require 'pry'
require 'sinatra'
require 'httparty'


get '/' do

  @search = params[:search]
  unless @search == nil
    @search.gsub!(/ /, '+')
    url = "http://omdbapi.com/?s=#{ @search }"
    response = HTTParty.get(url)
    @result = JSON.parse response
  end
  erb :search
end

get '/movie' do

  @movie_id = params[:id]
  if @movie_id != nil
    @movie_id.gsub!(/ /, '+')
    url = "http://omdbapi.com/?i=#{ @movie_id }"
    response = HTTParty.get(url)
    @movie = JSON.parse response
  end
  erb :movie
end

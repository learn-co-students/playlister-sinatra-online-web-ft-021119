class GenresController < ApplicationController

  get '/genres' do
    @songs = Song.all
    @genres = Genre.all
    erb :'/genres/index'
    #binding.pry
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    #binding.pry
    erb :'/genres/show'
  end
end

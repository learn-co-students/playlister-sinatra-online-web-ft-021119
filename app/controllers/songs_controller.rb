class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    #binding.pry
      if @song
        @artist = @song.artist
        @genre = @song.genres
      end
    erb :'/songs/show'
  end

  post '/songs/new' do
    @song = Song.create(name: params[:name])
    artist_from_form = params[:artist]
    if Artist.all.select {|artist| artist.name == params[:artist]}
      @song.artist = artist.name
      erb :'/songs/:slug'
    else
      Artist.create_by(params[:artist])
    end
    #binding.pry
    erb :songs/:slug
  end

  get 'songs/:slug/edit' do
    erb :'/songs/edit'
  end

end

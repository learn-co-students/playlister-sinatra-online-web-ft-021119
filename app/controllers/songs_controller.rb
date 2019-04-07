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
    @song = Song.create(name: params[:name])#create with name only

    #figure out if artist from form already exists in Artist.all
    artist_from_form = params[:artist]
    if Artist.find_by_name(name: artist_from_form)# if found by name
      artist = artist.find_by_name#set artist = existing object from artist class
      erb :'/songs/:slug'
    else
      # if not in Artist.all, create artist using form entry as artist name
      artist = Artist.create_by(name: artist_from_form)
    end

    @song.artist = artist_from_form #set new song object's artist = 
    erb :songs/:slug
  end

  get 'songs/:slug/edit' do
    erb :'/songs/edit'
  end

end

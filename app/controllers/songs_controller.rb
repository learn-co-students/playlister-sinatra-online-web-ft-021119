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
      if @song
        @artist = @song.artist
        @genre = @song.genres
      end
    #binding.pry
    erb :'/songs/show'
  end

  post '/songs/new' do
    binding.pry
    if !Song.where(name == params[:song])
      @song = Song.new
      @song.name = params[:name]
      @song.artist = params[:artist]
      @song.genre = params[:genre]
      @song.save
    end

    if Artist.where(name == params[:artist])
      erb :'/songs/:slug'
    else
      Artist.create_by(params[:artist])
    end
  end

  get 'songs/:slug/edit' do
    erb :'/songs/edit'
  end

end

class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    #binding.pry
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
    #binding.pry

    if !Artist.find_by(name: params[:artist][:name])
      artist = Artist.create(name: params[:artist][:name])
      @song = Song.create(name: params[:song][:name])#create with name only
      @song.artist = artist
    else
      @song = Song.create(name: params[:song][:name])#create with name only
      @song.artist = Artist.find_by(name: params[:artist][:name])
    end

    redirect "/songs/#{@song.slug}"
  end

  get 'songs/:slug/edit' do
    @song
    erb :"/songs/#{@song.slug}/edit"
  end

  patch 'songs/:slug/edit' do
    @song.artist = params[:song][:artist] if params[:song][:artist]
    @song.genre = params[:song][:genres] if params[:song][:genres]
    erb :"/songs/#{@song.slug}"
  end


end

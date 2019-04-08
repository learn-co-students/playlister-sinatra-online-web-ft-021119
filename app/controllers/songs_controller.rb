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
    @song = Song.create(name: params[:song][:name])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    # if !params["genres"].nil? 
    #   params["genres"].each do |id| 
    #     @genre = Genre.find(id) 
    #     @song.genres << @genre 
    #   end
    @song.genre_ids = params[:genres]
    @song.save
    flash[:message]="Successfully created song."

    redirect("/songs/#{@song.slug}")
  end


  get 'songs/:slug/edit' do
    binding.pry
    @song = Song.find_by_slug(params[:slug])
    erb :"/songs/edit"
  end

  patch 'songs/:slug/edit' do
    @song.artist = params[:song][:artist] if params[:song][:artist]
    @song.genre = params[:song][:genres] if params[:song][:genres]
    flash[:message]="Successfully edited song."
    erb :"/songs/#{@song.slug}"
  end


end

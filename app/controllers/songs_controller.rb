class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end
  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :'songs/new'
  end
  post '/songs' do

    genres = params[:song][:genres].map {|g| g.to_i}
    binding.pry
    song = Song.create(name: params[:song][:name])
    binding.pry
    song.genres = genres
    if !params[:artist][:name].empty?
        new_artist = Artist.create(name: params[:artist][:name])
        song.artist = new_artist
    end
    song.save
    binding.pry
    redirect "/songs/#{song.slug}"
  end
  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

end

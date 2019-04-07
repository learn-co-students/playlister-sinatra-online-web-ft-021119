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
    @genres = params[:genres].map {|g| Genre.find_or_create_by(name: g)}

    @song = Song.create(name: params[:song][:name])
    @song.genres << @genres
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.save
    redirect "/songs/#{@song.slug}"
  end


  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs/:slug/edit' do
    @artists = Artist.all
    @genres = Genre.all
    @song = Song.find_by_slug(params[:slug])
    redirect "/songs/#{@song.slug}/edit"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])

    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    binding.pry
    params.delete("_method")
  end

end

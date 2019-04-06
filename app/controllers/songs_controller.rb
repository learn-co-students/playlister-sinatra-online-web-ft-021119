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
    # @genres = Genre.all
    # @genres.map do |g|
    #   g.id
    # end

    genres = params[:song][:genres].map {|g| g.to_i}
    @genres = Genre.find_by_id(genres)


    song = Song.create(name: params[:song][:name])
    song.genres << @genres
    if !params[:artist][:name].empty?
        new_artist = Artist.create(name: params[:artist][:name]) unless Artist.find_by(name: params[:artist][:name])
        song.artist = new_artist
        song.save
    else

      existing_artist = Artist.find_by(name: params[:artist][:name])
      song.artist = existing_artist
      song.save
    end



    redirect "/songs/#{song.slug}"
  end
  get '/songs/:slug' do
    binding.pry
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

end

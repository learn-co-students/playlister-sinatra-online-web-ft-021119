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
    # need to account if genre isn't picked
    @genres = params[:genres].map {|g| Genre.find_or_create_by(name: g)}

    @song = Song.create(name: params[:song][:name])
    @song.genres << @genres
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    # if !params[:artist][:name].empty?
    #     new_artist = Artist.create(name: params[:artist][:name]) unless Artist.find_by(name: params[:artist][:name])
    #     @song.artist = new_artist
    #
    # else
    #   existing_artist = Artist.find_by(name: params[:artist][:name])
    #   @song.artist = existing_artist
    #
    # end
        @song.save
    redirect "/songs/#{@song.slug}"
  end


  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

end

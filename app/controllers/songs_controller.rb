class SongsController < ApplicationController

  get '/songs' do

    @songs = Song.all
    @name = @songs.first.name
      #binding.pry
    erb :"songs/index"
  end

end

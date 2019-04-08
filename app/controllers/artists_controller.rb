class ArtistsController < ApplicationController


  get '/' do
    erb :'artists/index'
  end


  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end

  get '/artists/:slug' do
    #binding.pry
    slug = params[:slug]
    @artist = Artist.find_by_slug(slug)
    erb :'/artists/show'
  end



end

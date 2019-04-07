class Genre < ActiveRecord::Base
  has_many :artists, through: :songs
  has_many :genres, through: :songs
  has_many :song_genres
end

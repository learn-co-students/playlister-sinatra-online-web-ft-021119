class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.downcase.gsub(/[^0-9a-z\- ]/, "").gsub(" ", "-")
  end

  def self.find_by_slug(song_name)
    song = Song.find{|song| song.slug == song_name}
  end
end

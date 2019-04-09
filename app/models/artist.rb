class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.downcase.gsub(/[^0-9a-z\- ]/, "").gsub(" ", "-")
  end

  def self.find_by_slug(artist_name)
    artist = Artist.find{|artist| artist.slug == artist_name}
  end
end

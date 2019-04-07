class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
  def slug
    self.name.downcase.gsub(/[^0-9a-z\- ]/, "").gsub(' ', '-')
  end
  def self.find_by_slug(name) #"taylor-swift"
    self.all.find do |x|
      x.slug == name
    end
  end
end

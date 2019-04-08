class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
  # extend Slugifiable::ClassMethods
  # include Slugifiable::InstanceMethods

  def slug
    self.name.downcase.gsub(/[^0-9a-z\- ]/, "").gsub(' ', '-')
  end

  def self.find_by_slug(name)
    self.all.find do |x|
      x.slug == name
    end
  end
  
end

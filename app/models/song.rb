class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
  # extend Slugifiable::ClassMethods
  # include Slugifiable::InstanceMethods

  def slug
    @slug = self.name.strip.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    name = "#{slug.gsub("-"," ")}".split.map(&:capitalize).join(" ")
    self.all.detect {|name| name.slug == slug}
  end
  
end

class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs
  # extend Slugifiable::ClassMethods
  # include Slugifiable::InstanceMethods


  def slug
    @slug = self.name.strip.downcase.gsub(" ","-")
  end



  def self.find_by_slug(slug)
    artist_name = "#{slug.gsub("-"," ")}".split.map(&:capitalize).join(" ")

    self..each do |artist|
      if artist.name == artist_name
        @artist = artist
              #binding.pry
      end
    end
  end

end

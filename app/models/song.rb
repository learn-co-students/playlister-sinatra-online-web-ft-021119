class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
  # extend Slugifiable::ClassMethods
  # include Slugifiable::InstanceMethods

  def slug
    self.name.downcase.gsub(' ', '-')
  end

  def self.find_by_slug(name)
    self.all.find do |x|
      x.slug == name
    end
  end

  # self.name.downcase.gsub(/[^0-9a-z\- ]/, "").gsub(' ', '-')

end

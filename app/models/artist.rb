
class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.downcase.gsub(/[^0-9a-z\- ]/, "").gsub(' ', '-')
  end
  def self.find_by_slug(name) #"taylor-swift"
    self.all.find do |x|
      x.slug == name
    end
  end
end

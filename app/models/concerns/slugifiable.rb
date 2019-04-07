module Slugifiable
  module InstanceMethods
    # def slug(artist_name)
    #   slug = artist_name.strip.downcase.gsub(" ","-")
    # end
  end

  module ClassMethods
    # def find_by_slug(slug)
    #   slug = "%#{slug.chars[0..20]gsub("-"," ")}%"
    #   found = self.where("name LIKE ?", slug)
    # end
  end
end

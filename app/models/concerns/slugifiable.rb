module Slugifiable
  module InstanceMethods
    def slug(song_name)
      song_name.gsub(" ","-").delete(/\W/)
    end
  end

  module ClassMethods
    def find_by_slug
    end
  end
  
end

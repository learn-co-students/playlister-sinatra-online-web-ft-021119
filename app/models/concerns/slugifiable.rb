module Slugifiable
  module InstanceMethods
    def slug
      @slug = self.name.strip.downcase.gsub(" ","-")
    end
  end

  module ClassMethods
    def self.find_by_slug(slug)
      name = "#{slug.gsub("-"," ")}".split.map(&:capitalize).join(" ")
      self.all.detect {|name| name.slug == slug}
    end
  end
end

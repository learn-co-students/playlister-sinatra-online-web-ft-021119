module Slug
  def slugify(item)
    item.downcase.gsub(/[^0-9a-z\- ]/, "").gsub(' ', '-')
  end
end

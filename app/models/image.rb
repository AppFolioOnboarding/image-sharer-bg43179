class Image < ApplicationRecord
  validates_format_of :image_url, with: /\A((https|ftp|http).*\.(png|jpg|jpeg))\z/i
  acts_as_taggable
end

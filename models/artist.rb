class Artist < ActiveRecord::Base
  has_many :albums
  has_many :songs

  has_one :rating, as: :details, class_name: 'Rating'
end

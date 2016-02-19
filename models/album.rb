class Album < ActiveRecord::Base
  belongs_to :artist

  has_many :songs

  has_one :rating, as: :details, class_name: 'Rating'
end

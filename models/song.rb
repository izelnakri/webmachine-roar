class Song < ActiveRecord::Base
  belongs_to :album
  belongs_to :artist

  # many artists can participate in a song .. not in this example ;)

  has_one :rating, as: :details, class_name: 'Rating'
end

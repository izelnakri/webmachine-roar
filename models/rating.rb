class Rating < ActiveRecord::Base
  validates :rating, presence: true
  validates :details, presence: true

  belongs_to :details, polymorphic: true
end

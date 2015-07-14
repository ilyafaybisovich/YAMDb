class Movie < ActiveRecord::Base
  validates_uniqueness_of :title
  has_many :reviews
end

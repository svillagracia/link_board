class Post < ActiveRecord::Base

  belongs_to :user
  has_many :comments
  has_many :votes, as: :votable
  validates :title,
    presence: true,
    length: {minimum: 10, maximum: 100}

  validates :link,
  presence: true,
  format: {with: URI.regexp}

end

class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :post
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  belongs_to :commentable, polymorphic: true
end

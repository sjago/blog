class Comment < ActiveRecord::Base

  belongs_to :post
  belongs_to :user

  validates :content, length: { minimum: 10 }

  has_many :votes, as: :voteable

end
class Post < ActiveRecord::Base

  validates :title, presence: true, length: { minimum: 4 }
  validates :content, presence: true, length: { minimum: 10, maximum: 500 }

  has_many :comments
  belongs_to :user

  has_many :post_categories
  has_many :categories, through: :post_categories

  has_many :votes, as: :voteable

  before_create :calculate_slug

  BAD_CHARACTERS = /[ :\-\.]/
  IRR_CHARACTERS = /[@?$%&^*!]/
  
  def calculate_slug

    self.slug = title.downcase
      .gsub(BAD_CHARACTERS, '_')
      .gsub(IRR_CHARACTERS, '')
      .gsub('__', '_')

  end


end



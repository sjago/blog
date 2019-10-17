class User < ActiveRecord::Base

  validates :name, length: { minimum: 3}
  validates :age, numericality: { only_integer: true }
  validates :email, uniqueness: true

  has_many :posts
  has_many :comments

  has_many :user_badges
  has_many :badges, through: :user_badges

  has_secure_password validations: false



end
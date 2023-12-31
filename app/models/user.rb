class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :reactions
  has_many :reacted_posts, through: :reactions, source: :post
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

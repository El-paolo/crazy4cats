class Post < ApplicationRecord
  belongs_to :user
  has_many :reactions, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :users, through: :reactions

  Kinds = %w[like dislike neutral].freeze
  KindsSpanish = {"like" => "Me gusta", "dislike" => "No me gusta", "neutral" => "Neutral"}.freeze

end

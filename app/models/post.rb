class Post < ApplicationRecord

  has_one_attached :image

  belongs_to :user
  belongs_to :category

  extend FriendlyId
  friendly_id :title, use: :slugged
end

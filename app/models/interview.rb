class Interview < ApplicationRecord
  belongs_to :user
  belongs_to :interviewcategory
  has_one_attached :image

  extend FriendlyId
  friendly_id :title, use: :slugged
end

class Interview < ApplicationRecord
  belongs_to :user
  belongs_to :interviewcategory
  #
  # extend FriendlyId
  # friendly_id :title, use: :slugged
end

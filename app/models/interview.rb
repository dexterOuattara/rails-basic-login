class Interview < ApplicationRecord
  belongs_to :user
  belongs_to :interviewcategory
end

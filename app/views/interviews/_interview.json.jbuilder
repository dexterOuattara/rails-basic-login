json.extract! interview, :id, :title, :description, :user_id, :interviewcategory_id, :created_at, :updated_at
json.url interview_url(interview, format: :json)

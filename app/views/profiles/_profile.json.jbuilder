json.extract! profile, :id, :user_id, :date_of_birth, :gender, :about_me, :hobbies, :created_at, :updated_at
json.url profile_url(profile, format: :json)

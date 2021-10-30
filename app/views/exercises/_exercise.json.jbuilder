json.extract! exercise, :id, :user_id, :workout_id, :completed_on, :weight,
              :reps, :created_at, :updated_at
json.url exercise_url(exercise, format: :json)

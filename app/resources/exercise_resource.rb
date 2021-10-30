class ExerciseResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :workout_id, :integer
  attribute :completed_on, :date
  attribute :weight, :integer
  attribute :reps, :string

  # Direct associations

  # Indirect associations

end

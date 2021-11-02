class Exercise < ApplicationRecord
  # Direct associations

  belongs_to :workout

  belongs_to :user

  # Indirect associations

  # Validations

  validates :completed_on, presence: true
  validates :weight, presence: true
  validates :reps, presence: true

  # Scopes
  
  def to_s
    workout.to_s + " on " + completed_on.to_s
  end
end

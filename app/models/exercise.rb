class Exercise < ApplicationRecord
  # Direct associations

  belongs_to :workout

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    user.to_s
  end

end

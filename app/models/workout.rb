class Workout < ApplicationRecord
  # Direct associations

  has_many   :exercises,
             :dependent => :destroy

  # Indirect associations

  has_many   :users,
             :through => :exercises,
             :source => :user

  # Validations

  validates :name, :uniqueness => true

  validates :name, :presence => true

  # Scopes

  def to_s
    name
  end

end

class User < ApplicationRecord
  include JwtToken
  # Direct associations

  has_many   :exercises,
             dependent: :destroy

  # Indirect associations

  has_many   :workouts,
             through: :exercises,
             source: :workout

  # Validations

  validates :first_name, presence: true

  validates :last_name, presence: true

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

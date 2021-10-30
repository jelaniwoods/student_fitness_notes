require "rails_helper"

RSpec.describe Workout, type: :model do
  describe "Direct Associations" do
    it { should have_many(:exercises) }
  end

  describe "InDirect Associations" do
    it { should have_many(:users) }
  end

  describe "Validations" do
    it { should validate_uniqueness_of(:name) }

    it { should validate_presence_of(:name) }
  end
end

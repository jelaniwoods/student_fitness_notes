require 'rails_helper'

RSpec.describe ExerciseResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'exercises',
          attributes: { }
        }
      }
    end

    let(:instance) do
      ExerciseResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Exercise.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:exercise) { create(:exercise) }

    let(:payload) do
      {
        data: {
          id: exercise.id.to_s,
          type: 'exercises',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      ExerciseResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { exercise.reload.updated_at }
      # .and change { exercise.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:exercise) { create(:exercise) }

    let(:instance) do
      ExerciseResource.find(id: exercise.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Exercise.count }.by(-1)
    end
  end
end

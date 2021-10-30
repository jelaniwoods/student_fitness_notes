require 'rails_helper'

RSpec.describe "exercises#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/exercises/#{exercise.id}"
  end

  describe 'basic destroy' do
    let!(:exercise) { create(:exercise) }

    it 'updates the resource' do
      expect(ExerciseResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Exercise.count }.by(-1)
      expect { exercise.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end

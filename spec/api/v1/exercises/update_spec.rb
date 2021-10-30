require 'rails_helper'

RSpec.describe "exercises#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/exercises/#{exercise.id}", payload
  end

  describe 'basic update' do
    let!(:exercise) { create(:exercise) }

    let(:payload) do
      {
        data: {
          id: exercise.id.to_s,
          type: 'exercises',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(ExerciseResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { exercise.reload.attributes }
    end
  end
end

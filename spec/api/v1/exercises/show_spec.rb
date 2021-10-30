require 'rails_helper'

RSpec.describe "exercises#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/exercises/#{exercise.id}", params: params
  end

  describe 'basic fetch' do
    let!(:exercise) { create(:exercise) }

    it 'works' do
      expect(ExerciseResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('exercises')
      expect(d.id).to eq(exercise.id)
    end
  end
end

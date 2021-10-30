require 'rails_helper'

RSpec.describe "exercises#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/exercises", params: params
  end

  describe 'basic fetch' do
    let!(:exercise1) { create(:exercise) }
    let!(:exercise2) { create(:exercise) }

    it 'works' do
      expect(ExerciseResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['exercises'])
      expect(d.map(&:id)).to match_array([exercise1.id, exercise2.id])
    end
  end
end

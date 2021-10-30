require "rails_helper"

RSpec.describe ExerciseResource, type: :resource do
  describe "serialization" do
    let!(:exercise) { create(:exercise) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(exercise.id)
      expect(data.jsonapi_type).to eq("exercises")
    end
  end

  describe "filtering" do
    let!(:exercise1) { create(:exercise) }
    let!(:exercise2) { create(:exercise) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: exercise2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([exercise2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:exercise1) { create(:exercise) }
      let!(:exercise2) { create(:exercise) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      exercise1.id,
                                      exercise2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      exercise2.id,
                                      exercise1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end

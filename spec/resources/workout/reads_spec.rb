require "rails_helper"

RSpec.describe WorkoutResource, type: :resource do
  describe "serialization" do
    let!(:workout) { create(:workout) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(workout.id)
      expect(data.jsonapi_type).to eq("workouts")
    end
  end

  describe "filtering" do
    let!(:workout1) { create(:workout) }
    let!(:workout2) { create(:workout) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: workout2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([workout2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:workout1) { create(:workout) }
      let!(:workout2) { create(:workout) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      workout1.id,
                                      workout2.id,
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
                                      workout2.id,
                                      workout1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end

class WorkoutsController < ApplicationController
  before_action :set_workout, only: %i[show edit update destroy]

  def index
    @q = Workout.ransack(params[:q])
    @workouts = @q.result(distinct: true).includes(:exercises,
                                                   :users).page(params[:page]).per(10)
  end

  def show
    @exercise = Exercise.new
  end

  def new
    @workout = Workout.new
  end

  def edit; end

  def create
    @workout = Workout.new(workout_params)

    if @workout.save
      redirect_to @workout, notice: "Workout was successfully created."
    else
      render :new
    end
  end

  def update
    if @workout.update(workout_params)
      redirect_to @workout, notice: "Workout was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @workout.destroy
    redirect_to workouts_url, notice: "Workout was successfully destroyed."
  end

  private

  def set_workout
    @workout = Workout.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(:name)
  end
end

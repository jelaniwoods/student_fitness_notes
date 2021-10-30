class ExercisesController < ApplicationController
  before_action :current_user_must_be_exercise_user, only: [:edit, :update, :destroy] 

  before_action :set_exercise, only: [:show, :edit, :update, :destroy]

  # GET /exercises
  def index
    @exercises = Exercise.all
  end

  # GET /exercises/1
  def show
  end

  # GET /exercises/new
  def new
    @exercise = Exercise.new
  end

  # GET /exercises/1/edit
  def edit
  end

  # POST /exercises
  def create
    @exercise = Exercise.new(exercise_params)

    if @exercise.save
      message = 'Exercise was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @exercise, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /exercises/1
  def update
    if @exercise.update(exercise_params)
      redirect_to @exercise, notice: 'Exercise was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /exercises/1
  def destroy
    @exercise.destroy
    message = "Exercise was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to exercises_url, notice: message
    end
  end


  private

  def current_user_must_be_exercise_user
    set_exercise
    unless current_user == @exercise.user
      redirect_back fallback_location: root_path, alert: "You are not authorized for that."
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_exercise
      @exercise = Exercise.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def exercise_params
      params.require(:exercise).permit(:user_id, :workout_id, :completed_on, :weight, :reps)
    end
end

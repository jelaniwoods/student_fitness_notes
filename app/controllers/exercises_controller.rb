class ExercisesController < ApplicationController
  before_action :current_user_must_be_exercise_user,
                only: %i[edit update destroy]

  before_action :set_exercise, only: %i[show edit update destroy]

  def index
    @q = Exercise.ransack(params[:q])
    @exercises = @q.result(distinct: true).includes(:user,
                                                    :workout).page(params[:page]).per(10)
  end

  def show; end

  def new
    @exercise = Exercise.new
  end

  def edit; end

  def create
    @exercise = Exercise.new(exercise_params)

    if @exercise.save
      message = "Exercise was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @exercise, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @exercise.update(exercise_params)
      redirect_to @exercise, notice: "Exercise was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @exercise.destroy
    message = "Exercise was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to exercises_url, notice: message
    end
  end

  private

  def current_user_must_be_exercise_user
    set_exercise
    unless current_user == @exercise.user
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_exercise
    @exercise = Exercise.find(params[:id])
  end

  def exercise_params
    params.require(:exercise).permit(:user_id, :workout_id, :completed_on,
                                     :weight, :reps)
  end
end

class ExercisesController < ApplicationController
  before_action :current_user_must_be_exercise_user,
                only: %i[edit update destroy]

  before_action :set_exercise, only: %i[show edit update destroy]

  def index
    @q = current_user.exercises.ransack(params[:q])
    @exercises = @q.
                   result(distinct: true).
                   includes(:user, :workout).
                   order(completed_on: :desc).
                   page(params[:page]).
                   per(25)
  
  
    last_created_exercise = current_user.exercises.order(created_at: :desc).first

    @new_exercise = current_user.exercises.build(
      workout: last_created_exercise.try(:workout),
      completed_on: Date.today,
      reps: last_created_exercise.try(:reps),
      weight: last_created_exercise.try(:weight)
    )
  end

  def show; end

  def new
    @exercise = Exercise.new
  end

  def edit; end

  def create
    @exercise = Exercise.new(exercise_params.merge(user: current_user))

    if @exercise.save
      message = "Exercise was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to exercises_url, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @exercise.update(exercise_params)
      redirect_to exercises_url, notice: "Exercise was successfully updated."
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

class AddWorkoutReferenceToExercises < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :exercises, :workouts
    add_index :exercises, :workout_id
    change_column_null :exercises, :workout_id, false
  end
end

class CreateExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.integer :user_id
      t.integer :workout_id
      t.date :completed_on
      t.integer :weight
      t.string :reps

      t.timestamps
    end
  end
end

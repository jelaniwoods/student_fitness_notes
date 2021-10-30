class AddUserReferenceToExercises < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :exercises, :users
    add_index :exercises, :user_id
    change_column_null :exercises, :user_id, false
  end
end

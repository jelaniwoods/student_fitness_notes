namespace :dev do
  desc "Pre-populate database with dummy data"
  task prime: :environment do
    if Rails.env.production?
      ActiveRecord::Base.connection.tables.each do |t|
        ActiveRecord::Base.connection.reset_pk_sequence!(t)
      end
    end
    Exercise.destroy_all
    Workout.destroy_all
    User.destroy_all
    
    workouts =  [ 
      {id: 1, name: "Chest Press", created_at: 2.days.ago, updated_at: 2.days.ago},
      {id: 2, name: "Seated Back Row", created_at: 2.days.ago, updated_at: 2.days.ago},
      {id: 3, name: "Crunch", created_at: 2.days.ago, updated_at: 2.days.ago},
      {id: 4, name: "Seated Leg Curl", created_at: 2.days.ago, updated_at: 2.days.ago},
      {id: 5, name: "Bench Press", created_at: 2.days.ago, updated_at: 2.days.ago},
      {id: 6, name: "Biceps Curl", created_at: 2.days.ago, updated_at: 2.days.ago},
      {id: 7, name: "Upright Row", created_at: 2.days.ago, updated_at: 2.days.ago},
      {id: 8, name: "Side Bend", created_at: 2.days.ago, updated_at: 2.days.ago},
      {id: 9, name: "Shoulder Press", created_at: 2.days.ago, updated_at: 2.days.ago},
      {id: 10, name: "Front Deltoid Raise", created_at: 2.days.ago, updated_at: 2.days.ago},
      {id: 11, name: "Lateral Deltoid Raise", created_at: 2.days.ago, updated_at: 2.days.ago},
      {id: 12, name: "Squat", created_at: 2.days.ago, updated_at: 2.days.ago},
      {id: 13, name: "Chest Fly", created_at: 2.days.ago, updated_at: 2.days.ago},
      {id: 14, name: "Side Lunge", created_at: 2.days.ago, updated_at: 2.days.ago},
      {id: 15, name: "Calf Raise", created_at: 2.days.ago, updated_at: 2.days.ago},
      {id: 16, name: "Triceps Kickback", created_at: 2.days.ago, updated_at: 2.days.ago},
      {id: 17, name: "One-Arm Row on Knee", created_at: 2.days.ago, updated_at: 2.days.ago},
      {id: 18, name: "Stiff-Legged Deadlift", created_at: 2.days.ago, updated_at: 2.days.ago},
      {id: 19, name: "Standing Back Row", created_at: 2.days.ago, updated_at: 2.days.ago},
      {id: 20, name: "Plank", created_at: 2.days.ago, updated_at: 2.days.ago},
      {id: 21, name: "Pull Ups", created_at: 2.days.ago, updated_at: 2.days.ago},
      {id: 22, name: "Push Ups", created_at: 2.days.ago, updated_at: 2.days.ago},
      {id: 23, name: "Dumbbell Chest Fly", created_at: 2.days.ago, updated_at: 2.days.ago},
      {id: 24, name: "Deadlift", created_at: 2.days.ago, updated_at: 2.days.ago},
      {id: 25, name: "Seated Row", created_at: 2.days.ago, updated_at: 2.days.ago},
      {id: 26, name: "Barbell Lunges", created_at: 2.days.ago, updated_at: 2.days.ago},
      {id: 27, name: "Skull Crushers", created_at: 2.days.ago, updated_at: 2.days.ago}
    ]
    Workout.insert_all(workouts)

    p "Workouts: #{Workout.count}"

    users = [
      { first_name: "Alice", last_name: "Smith", email: "alice@example.com" },
      { first_name: "Bob", last_name: "Forrest", email: "bob@example.com" },
      { first_name: "Carol", last_name: "Foreman", email: "carol@example.com" },
      { first_name: "Jane", last_name: "Doe", email: "jane@example.com" },
      { first_name: "Riddhi", last_name: "Patel", email: "riddhi@example.com" },
    ]

    users.each do |user|
      new_user = User.new(user)
      new_user.password = "password"
      new_user.save
    end
    p "Users: #{User.count}"

    user = User.first
    user.exercises.create(workout_id: 3, weight: 20, reps: 3, completed_on: "2021-10-08")
    user.exercises.create(workout_id: 3, weight: 20, reps: 3, completed_on: "2021-10-08")
    user.exercises.create(workout_id: 13, weight: 10, reps: 5, completed_on: "2021-10-09")
    user.exercises.create(workout_id: 13, weight: 10, reps: 5, completed_on: "2021-10-09")
    user.exercises.create(workout_id: 13, weight: 10, reps: 5, completed_on: "2021-10-09")
    user.exercises.create(workout_id: 16, weight: 20, reps: 3, completed_on: "2021-10-10")
    user.exercises.create(workout_id: 16, weight: 20, reps: 3, completed_on: "2021-10-10")
    user.exercises.create(workout_id: 18, weight: 25, reps: 4, completed_on: "2021-10-10")
    user.exercises.create(workout_id: 18, weight: 25, reps: 3, completed_on: "2021-10-10")
    user.exercises.create(workout_id: 5, weight: 55, reps: 3, completed_on: "2021-10-14")
    user.exercises.create(workout_id: 5, weight: 55, reps: 3, completed_on: "2021-10-14")

    user = User.second
    user.exercises.create(workout_id: 2, weight: 25, reps: 3, completed_on: "2021-10-06")
    user.exercises.create(workout_id: 2, weight: 25, reps: 3, completed_on: "2021-10-06")
    user.exercises.create(workout_id: 25, weight: 30, reps: 3, completed_on: "2021-10-09")
    user.exercises.create(workout_id: 25, weight: 30, reps: 3, completed_on: "2021-10-09")
    user.exercises.create(workout_id: 12, weight: 10, reps: 5, completed_on: "2021-10-09")
    user.exercises.create(workout_id: 16, weight: 20, reps: 3, completed_on: "2021-10-12")
    user.exercises.create(workout_id: 16, weight: 20, reps: 3, completed_on: "2021-10-12")
    user.exercises.create(workout_id: 10, weight: 25, reps: 2, completed_on: "2021-10-12")
    user.exercises.create(workout_id: 10, weight: 25, reps: 2, completed_on: "2021-10-12")
    user.exercises.create(workout_id: 17, weight: 15, reps: 3, completed_on: "2021-10-15")
    user.exercises.create(workout_id: 17, weight: 15, reps: 3, completed_on: "2021-10-15")

    user = User.third
    user.exercises.create(workout_id: 27, weight: 10, reps: 3, completed_on: "2021-10-01")
    user.exercises.create(workout_id: 27, weight: 10, reps: 3, completed_on: "2021-10-01")
    user.exercises.create(workout_id: 2, weight: 30, reps: 3, completed_on: "2021-10-07")
    user.exercises.create(workout_id: 2, weight: 30, reps: 3, completed_on: "2021-10-07")
    user.exercises.create(workout_id: 11, weight: 10, reps: 5, completed_on: "2021-10-07")
    user.exercises.create(workout_id: 14, weight: 20, reps: 3, completed_on: "2021-10-12")
    user.exercises.create(workout_id: 14, weight: 20, reps: 3, completed_on: "2021-10-12")
    user.exercises.create(workout_id: 12, weight: 25, reps: 2, completed_on: "2021-10-12")
    user.exercises.create(workout_id: 12, weight: 25, reps: 2, completed_on: "2021-10-12")
    user.exercises.create(workout_id: 26, weight: 15, reps: 5, completed_on: "2021-10-15")
    user.exercises.create(workout_id: 26, weight: 15, reps: 5, completed_on: "2021-10-15")

    user = User.fourth
    user.exercises.create(workout_id: 7, weight: 10, reps: 3, completed_on: "2021-10-01")
    user.exercises.create(workout_id: 7, weight: 10, reps: 3, completed_on: "2021-10-01")
    user.exercises.create(workout_id: 16, weight: 30, reps: 2, completed_on: "2021-10-17")
    user.exercises.create(workout_id: 16, weight: 30, reps: 2, completed_on: "2021-10-17")
    user.exercises.create(workout_id: 13, weight: 10, reps: 5, completed_on: "2021-10-17")
    user.exercises.create(workout_id: 18, weight: 40, reps: 3, completed_on: "2021-10-22")
    user.exercises.create(workout_id: 18, weight: 40, reps: 3, completed_on: "2021-10-22")
    user.exercises.create(workout_id: 19, weight: 25, reps: 3, completed_on: "2021-10-22")
    user.exercises.create(workout_id: 19, weight: 25, reps: 3, completed_on: "2021-10-22")
    user.exercises.create(workout_id: 21, weight: 15, reps: 5, completed_on: "2021-10-25")
    user.exercises.create(workout_id: 21, weight: 15, reps: 4, completed_on: "2021-10-25")
    
    user = User.fifth
    user.exercises.create(workout_id: 6, weight: 10, reps: 3, completed_on: "2021-10-31")
    user.exercises.create(workout_id: 6, weight: 10, reps: 3, completed_on: "2021-10-31")
    user.exercises.create(workout_id: 6, weight: 10, reps: 3, completed_on: "2021-10-31")

    p "Exercises: #{Exercise.count}"
  end
end

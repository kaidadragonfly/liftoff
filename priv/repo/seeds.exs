# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Liftoff.Repo.insert!(%Liftoff.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Liftoff.Repo.insert!(%Liftoff.Workouts.Exercise{name: "Squat", day: :a})
Liftoff.Repo.insert!(%Liftoff.Workouts.Exercise{name: "Bench/Floor Press", day: :a})
Liftoff.Repo.insert!(%Liftoff.Workouts.Exercise{name: "Row", day: :a})

Liftoff.Repo.insert!(%Liftoff.Workouts.Exercise{name: "Deadlift", day: :b})
Liftoff.Repo.insert!(%Liftoff.Workouts.Exercise{name: "Overhead Press", day: :b})
Liftoff.Repo.insert!(%Liftoff.Workouts.Exercise{name: "Lat Pulldown", day: :b})

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

alias Liftoff.Repo
alias Liftoff.Workouts.Exercise

# Day A
Repo.insert!(
  %Exercise{name: "Squat", day: :a, step: 5.0},
  on_conflict: [set: [day: :a, step: 5.0]],
  conflict_target: :name
)

Repo.insert!(
  %Exercise{name: "Bench/Floor Press", day: :a, step: 2.5},
  on_conflict: [set: [day: :a, step: 2.5]],
  conflict_target: :name
)

Repo.insert!(
  %Exercise{name: "Row", day: :a, step: 2.5},
  on_conflict: [set: [day: :a, step: 2.5]],
  conflict_target: :name
)

# Day B

Repo.insert!(
  %Exercise{name: "Deadlift", day: :b, step: 5.0},
  on_conflict: [set: [day: :b, step: 5.0]],
  conflict_target: :name
)

Repo.insert!(
  %Exercise{name: "Overhead Press", day: :b, step: 2.5},
  on_conflict: [set: [day: :b, step: 2.5]],
  conflict_target: :name
)

Repo.insert!(
  %Exercise{name: "Lat Pulldown", day: :b, step: 2.5},
  on_conflict: [set: [day: :b, step: 2.5]],
  conflict_target: :name
)

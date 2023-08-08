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
  %Exercise{
    name: "Squat",
    day: :a,
    step: 5.0,
    sets: 5,
    reps: 5,
    weights: [2.5, 2.5, 2.5, 10.0, 20.0, 20.0, 20.0, 20.0]
  },
  on_conflict: {:replace, [:name, :day, :step, :sets, :reps, :weights]},
  conflict_target: :name
)

Repo.insert!(
  %Exercise{
    name: "Bench/Floor Press",
    day: :a,
    step: 2.5,
    sets: 5,
    reps: 5,
    weights: [2.5, 2.5, 2.5, 10.0, 20.0, 20.0, 20.0, 20.0]
  },
  on_conflict: {:replace, [:name, :day, :step, :sets, :reps, :weights]},
  conflict_target: :name
)

Repo.insert!(
  %Exercise{
    name: "Row",
    day: :a,
    step: 2.5,
    sets: 3,
    reps: 8,
    weights: [2.5, 2.5, 2.5, 10.0, 20.0, 20.0, 20.0, 20.0]
  },
  on_conflict: {:replace, [:name, :day, :step, :sets, :reps, :weights]},
  conflict_target: :name
)

# Day B

Repo.insert!(
  %Exercise{
    name: "Deadlift",
    day: :b,
    step: 5.0,
    sets: 5,
    reps: 5,
    weights: [2.5, 2.5, 2.5, 10.0, 20.0, 20.0, 20.0, 20.0]
  },
  on_conflict: {:replace, [:name, :day, :step, :sets, :reps, :weights]},
  conflict_target: :name
)

Repo.insert!(
  %Exercise{
    name: "Overhead Press",
    day: :b,
    step: 2.5,
    sets: 3,
    reps: 5,
    weights: [2.5, 2.5, 2.5, 10.0, 20.0, 20.0, 20.0, 20.0]
  },
  on_conflict: {:replace, [:name, :day, :step, :sets, :reps, :weights]},
  conflict_target: :name
)

Repo.insert!(
  %Exercise{
    name: "Lat Pulldown",
    day: :b,
    step: 2.5,
    sets: 3,
    reps: 8,
    weights: [3.0, 5.0, 8.0, 13.0, 19.0, 23.0, 30.0]
  },
  on_conflict: {:replace, [:name, :day, :step, :sets, :reps, :weights]},
  conflict_target: :name
)

alias Liftoff.Workouts
alias Liftoff.Accounts

logs_without_users =
  Workouts.list_logs()
  |> Repo.preload(:user)
  |> Repo.preload(:exercise)
  |> Enum.filter(fn log -> is_nil(log.user) end)

Accounts.list_users()
|> Enum.each(fn user ->
  logs_without_users
  |> Enum.each(fn log ->
    {:ok, _} =
      Workouts.create_log(%{
        user: user,
        exercise: log.exercise,
        date: log.date,
        weight: log.weight
      })
  end)
end)

logs_without_users
|> Enum.each(fn log -> Workouts.delete_log(log) end)

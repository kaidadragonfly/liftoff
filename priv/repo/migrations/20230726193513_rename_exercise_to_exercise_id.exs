defmodule Liftoff.Repo.Migrations.RenameExerciseToExerciseId do
  use Ecto.Migration

  def change do
    rename table(:log), :exercise, to: :exercise_id
  end
end

defmodule Liftoff.Repo.Migrations.AddConstraintsToExercise do
  use Ecto.Migration

  def change do
    create unique_index(:exercise, [:name])
  end
end

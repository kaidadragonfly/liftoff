defmodule Liftoff.Repo.Migrations.AddExerciseWeights do
  use Ecto.Migration

  def change do
    alter table(:exercise) do
      add :weights, {:array, :float}
    end
  end
end

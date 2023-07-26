defmodule Liftoff.Repo.Migrations.AddRepsAndSets do
  use Ecto.Migration

  def change do
    alter table(:exercise) do
      add :reps, :integer
      add :sets, :integer
    end
  end
end

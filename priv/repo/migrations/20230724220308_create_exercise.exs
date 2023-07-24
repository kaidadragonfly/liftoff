defmodule Liftoff.Repo.Migrations.CreateExercise do
  use Ecto.Migration

  def change do
    create table(:exercise) do
      add :name, :string
      add :day, :string

      timestamps()
    end
  end
end

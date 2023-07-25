defmodule Liftoff.Repo.Migrations.CreateLog do
  use Ecto.Migration

  def change do
    create table(:log) do
      add :date, :date
      add :exercise, references(:exercise, on_delete: :nothing)

      timestamps()
    end

    create index(:log, [:exercise])
  end
end

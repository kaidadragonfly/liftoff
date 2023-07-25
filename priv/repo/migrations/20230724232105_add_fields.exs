defmodule Liftoff.Repo.Migrations.AddFields do
  use Ecto.Migration

  def change do
    alter table(:exercise) do
      add :step, :float
    end

    alter table(:log) do
      add :weight, :float
    end
  end
end

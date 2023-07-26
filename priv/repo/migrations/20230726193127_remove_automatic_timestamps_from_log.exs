defmodule Liftoff.Repo.Migrations.RemoveAutomaticTimestampsFromLog do
  use Ecto.Migration

  def change do
    alter table(:log) do
      remove :inserted_at
      remove :updated_at
    end
  end
end

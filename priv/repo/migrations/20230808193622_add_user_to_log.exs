defmodule Liftoff.Repo.Migrations.AddUserToLog do
  use Ecto.Migration

  def change do
    alter table(:log) do
      add :user_id, references(:user, on_delete: :nothing)
    end
  end
end

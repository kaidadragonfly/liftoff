defmodule Liftoff.Repo.Migrations.AddUserToExercise do
  use Ecto.Migration

  alias Liftoff.Repo
  alias Liftoff.Workouts
  alias Liftoff.Accounts

  def change do
    alter table(:log) do
      add :user_id, references(:user, on_delete: :nothing)
    end
  end
end

defmodule Liftoff.Repo.Migrations.RenameUsersToUser do
  use Ecto.Migration

  def change do
    alter table(:log) do
      remove :user_id
    end

    drop table(:user)
    rename table(:users), to: table(:user)
  end
end
